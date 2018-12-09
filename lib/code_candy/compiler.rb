# Dockerを用いて提出されたプログラムを実行するモジュール

require 'json'
require 'fileutils'
require 'open3'
require 'docker'
require 'docker-api'
require 'timeout'

require './lib/code_candy/container'
require './lib/code_candy/compiler_logic'
require './lib/code_candy/language'
require './lib/code_candy/parameter'

module CodeCandy
  class Compiler
    def initialize
      @exec_data = CodeCandy::Parameter.get_exec_data
    end

    # 引数
    # language: どの言語で動かすプログラムなのかを格納してある
    # source_code: 実行するプログラムが格納されている
    # input: 標準入力に使う値が格納されている
    # 返り値
    # return_params
    def exec(language, source_code, input)
      # ==== 事前処理 ====
      exec_time = Time.now.to_i

      data = {
        "source_code": source_code.force_encoding("UTF-8"),
        "input_file":  'input',
        "input_content": input,
        "work_dir":   "workspace_#{exec_time}",
        "cmd":         @exec_data[:"#{language}"].cmd
      }
      # ==================

      container = Container.create(exec_time, data[:work_dir], language)

      compiler_logic = CodeCandy::CompilerLogic.new(container, data)
      return compiler_logic.exec
    end
  end
end
