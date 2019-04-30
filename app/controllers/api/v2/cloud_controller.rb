require './lib/code_candy/code_runner'
require './lib/code_candy/language'

class Api::V2::CloudController < Api::ApiController
  before_action :authenticate_api_token
  protect_from_forgery except: :compiler

  # APIとして利用できるコンパイラ
  def compiler
    # 送られてきたパラメータを変数に格納
    language = params[:language]
    source_code = params[:source_code]
    input = params[:input]

    code_runner = CodeCandy::CodeRunner.new

    begin
      submit_language = CodeCandy::Language.get_language_data[:"#{language}"][:language]
      # 提出されたコードを保存
      @result = code_runner.exec(language, source_code, input, auth_user.id)
      # 入力が不正な場合はレコードしない
      CloudCompiler.create(code: source_code, language: submit_language, user_id: auth_user.id) unless @result[:input_error]
    rescue => e
      puts "============"
      pp e
      puts "============"
      @result = {stdout: "Error",stderr: "入力が不正です。", time: "", exit_code: 1, input_error: true}
    end

    @result[:stdout] = @result[:stdout].force_encoding("UTF-8")
    @result[:stderr] = @result[:stderr].force_encoding("UTF-8")

    render json: @result
  end
end
