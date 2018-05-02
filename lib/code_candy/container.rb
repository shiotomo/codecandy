# Dockerを用いて提出されたプログラムを実行するモジュール

require 'json'
require 'fileutils'
require 'open3'
require 'docker'
require 'docker-api'
require 'timeout'

module CodeCandy
  class Container
    # 引数
    # language: どの言語で動かすプログラムなのかを格納してある
    # source_code: 実行するプログラムが格納されている
    # input: 標準入力に使う値が格納されている
    # 返り値
    # return_params
    def init(language, source_code, input)
      # 現在の時間を格納
      exec_time = Time.now.to_f
      source_code = source_code.force_encoding("UTF-8")

      # ファイルを作成する準備
      source_file = 'main'
      input_file  = 'input'
      work_dir     = "workspace_#{exec_time}"

      # 実行する言語ごとにファイルの名前を確定させ、実行コマンドを設定する
      case language
      when 'Ruby'
        source_file += '.rb'
        exec_cmd = "ruby #{source_file}"
      when 'Python'
        source_file += '.py'
        exec_cmd = "python3 #{source_file}"
      when 'C'
        filename_id = source_file
        source_file += '.c'
        # clangを使ったコマンド
        # exec_cmd = "cc -Wall -o #{filename_id} #{source_file} && ./#{filename_id}"
        # gccを使ったコマンド
        exec_cmd = "gcc -o #{filename_id} #{source_file} && ./#{filename_id}"
      end

      # コンテナを作成
      container = Docker::Container.create(
        name: "test_#{exec_time}",
        Image: 'codecandy/compile',
        WorkingDir: '/workspace',
        Memory: 512 * 1024**2,
        MemorySwap: 512 * 1024**2,
        PidsLimit: 30,
        HostConfig: {
          Binds: ["/tmp/#{work_dir}:/workspace"]
        },
        Tty: true
      )

      # Open3を利用してディレクトリを作成＆権限の変更
      Open3.popen3("mkdir /tmp/#{work_dir} && chmod 777 /tmp/#{work_dir}") do |i, o, e, w| 
        i.close
        o.each do |line| p line end
        e.each do |line| p line end
      end

      # プログラムのファイルの作成
      File.open("/tmp/#{work_dir}/#{source_file}", "w") do |f|
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
        Timeout.timeout(3) do
          # === 実行ここから ===
          container.start
          container_cmd = "cd /workspace && /usr/bin/time -q -f \"%e\" -o /workspace/time.txt timeout 3 #{exec_cmd} < #{input_file}" 
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
  end
end
