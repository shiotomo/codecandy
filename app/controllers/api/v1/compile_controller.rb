require './lib/code_candy/compiler'
require './lib/code_candy/parameter'

class Api::V1::CompileController < Api::ApiController
  def exec
    # 送られてきたパラメータを変数に格納
    language = params[:language]
    source_code = params[:source_code]
    input = params[:input]
    compiler = CodeCandy::Compiler.new
    submit_language = CodeCandy::Parameter.get_submit_language(language)

    # 提出されたコードを保存
    Code.create(
      code: source_code,
      language: submit_language,
      user_id: current_user.id
    )

    result = compiler.exec(language, source_code, input)

    result[:stdout] = result[:stdout].force_encoding("UTF-8")
    result[:stderr] = result[:stderr].force_encoding("UTF-8")

    render json: result
  end
end
