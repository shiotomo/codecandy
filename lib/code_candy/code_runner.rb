# Dockerを用いて提出されたプログラムを実行するモジュール

require './lib/code_candy/container'
require './lib/code_candy/compiler'
require './lib/code_candy/language'

module CodeCandy
  class CodeRunner
    # 引数
    #   language: どの言語で動かすプログラムなのかを格納してある
    #   source_code: 実行するプログラムが格納されている
    #   input: 標準入力に使う値が格納されている
    #   user_id: ユーザのid
    def initialize(language, source_code, input, user_id)
      @language = language
      @source_code = source_code
      @input = input
      @user_id = user_id
      @language_data = CodeCandy::Language.get_language_data
    end

    # 返り値
    #   return_params
    def exec
      # ==== 事前処理 ====
      # languageが不正入力の場合の処理
      error_params = {stdout: "Error",stderr: "入力が不正です。", time: "", exit_code: 1, input_error: true}
      return error_params unless @language_data.has_key?(:"#{@language}")

      # 実行時間の取得
      exec_time = Time.now.to_i

      data = {
        "source_code":   @source_code.force_encoding("UTF-8"),
        "input_file":    'input',
        "input_content": @input,
        "work_dir":      "workspace_#{exec_time}_#{@user_id}",
        "language_data": @language_data[:"#{@language}"]
      }
      # ==================

      # ==== コード実行部分 ====
      container = Container.create(exec_time, data[:work_dir], @language_data[:"#{@language}"][:image_name], @user_id)
      compiler = CodeCandy::Compiler.new(container, data)

      return compiler.exec
      # ========================
    end
  end
end
