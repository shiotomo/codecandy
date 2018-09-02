# Dockerを用いて提出されたプログラムを実行するモジュール

require 'json'
require 'fileutils'
require 'open3'
require 'docker'
require 'docker-api'
require 'timeout'

require './lib/code_candy/container'
require './lib/logic/compiler_logic'
require './lib/code_candy/language'

module CodeCandy
  class Compiler
    def initialize
      @exec_data = {
       "Ruby":    Ruby.new,
       "Python3": Python3.new,
       "Gcc":     Gcc.new,
       "Clang":   Clang.new,
       "Golang":  Golang.new,
       "Nodejs":  Nodejs.new,
       "Java":    Java.new,
       "Scala":   Scala.new,
       "Swift":   Swift.new,
       "CPP":     CPP.new,
       "PHP":     PHP.new,
       "Perl":    Perl.new,
       "Bash":    Bash.new,
       "Lua":     Lua.new
      }
    end

    # 引数
    # language: どの言語で動かすプログラムなのかを格納してある
    # source_code: 実行するプログラムが格納されている
    # input: 標準入力に使う値が格納されている
    # 返り値
    # return_params
    def exec(language, source_code, input)
      # ==== 事前処理 ====
      exec_time = Time.now.to_f

      data = {
        "source_code": source_code.force_encoding("UTF-8"),
        "input_file":  'input',
        "input_content": input,
        "work_dir":   "workspace_#{exec_time}",
        "cmd":         @exec_data[:"#{language}"].cmd
      }
      # ==================

      container = Container.create(exec_time, data[:work_dir], language)

      compiler_logic = CompilerLogic.new(container, data)
      return compiler_logic.exec
    end
  end
end
