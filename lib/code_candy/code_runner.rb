# Dockerを用いて提出されたプログラムを実行するモジュール

require 'json'
require 'fileutils'
require 'open3'
require 'docker'
require 'docker-api'
require 'timeout'

require './lib/code_candy/container'
require './lib/code_candy/compiler'
require './lib/code_candy/language'

module CodeCandy
  class CodeRunner
    def initialize
      @language_data = CodeCandy::Language.get_language_data
    end

    # 引数
    #   language: どの言語で動かすプログラムなのかを格納してある
    #   source_code: 実行するプログラムが格納されている
    #   input: 標準入力に使う値が格納されている
    # 返り値
    #   return_params
    def exec(language, source_code, input, user_id)
      # ==== 事前処理 ====
      # 実行時間の取得
      exec_time = Time.now.to_i

      # languageが不正入力の場合の処理
      error_params = {stdout: "Error",stderr: "入力が不正です。", time: "", exit_code: 1, input_error: true}
      return error_params unless @language_data.has_key?(:"#{language}")

      data = {
        "source_code":   source_code.force_encoding("UTF-8"),
        "input_file":    'input',
        "input_content": input,
        "work_dir":      "workspace_#{exec_time}_#{user_id}",
        "language_data": @language_data[:"#{language}"]
      }
      # ==================

      # ==== コード実行部分 ====
      container = Container.create(exec_time, data[:work_dir], language, user_id)
      compiler = CodeCandy::Compiler.new(container, data)
      # ========================

      return compiler.exec
    end
  end
end
