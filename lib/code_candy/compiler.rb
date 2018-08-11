# Dockerを用いて提出されたプログラムを実行するモジュール

require 'json'
require 'fileutils'
require 'open3'
require 'docker'
require 'docker-api'
require 'timeout'

require './lib/code_candy/container'
require './lib/code_candy/language'

module CodeCandy
  class Compiler
    # 引数
    # language: どの言語で動かすプログラムなのかを格納してある
    # source_code: 実行するプログラムが格納されている
    # input: 標準入力に使う値が格納されている
    # 返り値
    # return_params
    def exec(language, source_code, input)
      # ==== 事前処理 ====
      # 現在の時間を格納
      exec_time = Time.now.to_f
      source_code = source_code.force_encoding("UTF-8")

      # ファイルを作成する準備
      input_file  = 'input'
      work_dir     = "workspace_#{exec_time}"

      # ==================

      # 実行データを生成
      exec_data = exec_data(language)
      cmd = exec_data.cmd

      # コンテナを作成
      # * 一時的に同じコンテナを利用している
      container = Container.create(exec_time, work_dir, language)

      # Open3を利用してディレクトリを作成＆権限の変更
      Open3.popen3("mkdir /tmp/#{work_dir} && chmod 777 /tmp/#{work_dir}") do |i, o, e| 
        i.close
        o.each do |line| p line end
        e.each do |line| p line end
      end

      # プログラムのファイルの作成
      File.open("/tmp/#{work_dir}/#{cmd[:source_file]}", "w") do |f|
        source_code.each_line do |line|
          f.puts(line)
        end
      end

      # 標準入力用のファイルの作成
      File.open("/tmp/#{work_dir}/#{input_file}", "w") do |f|
        input.each_line do |line|
          f.puts(line)
        end
      end

      # コンテナを利用してプログラムを実行
      return_params = {}

      begin
        Timeout.timeout(cmd[:time_out]) do
          # === 実行ここから ===
          container.start
          container_cmd = "cd /workspace && /usr/bin/time -q -f \"%e\" -o /workspace/time.txt timeout #{cmd[:time_out]} #{cmd[:exec_cmd]} < #{input_file}"
          res = container.exec(['bash', '-c', container_cmd])
          container.stop
          container.delete(force: true)
          # === 実行ここまで ===

          # 実行にかかった時間をproc_timeに格納
          proc_time = ""
          File.open("/tmp/#{work_dir}/time.txt", "r") do |f|
            proc_time = f.gets.chomp
          end
          proc_time += "[s]"

          FileUtils.rm_r("/tmp/#{work_dir}")

          return_params = {stdout: res[0].join(''), stderr: res[1].join(''), time: proc_time, exit_code: res[2]}
        end
      rescue Timeout::Error
        container.stop
        container.delete(force: true)
        return_params = {stdout: "Time out!",stderr: "Time out!", time: "", exit_code: 128}
      end

      return return_params
    end

    # 言語ごとにインスタンスを生成
    def exec_data(language)
      case language
      when 'Ruby'
        return Ruby.new
      when 'Python3'
        return Python3.new
      when 'Gcc'
        return Gcc.new
      when 'Clang'
        return Clang.new
      when 'Golang'
        return Golang.new
      when 'Nodejs'
        return Nodejs.new
      when 'Java'
        return Java.new
      when 'Scala'
        return Scala.new
      when 'Swift'
        return Swift.new
      when 'CPP'
        return CPP.new
      when 'PHP'
        return PHP.new
      when 'Perl'
        return Perl.new
      when 'Bash'
        return Bash.new
      when 'Lua'
        return Lua.new
      end
    end
  end
end
