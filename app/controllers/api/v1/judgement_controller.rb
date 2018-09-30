# 提出されたプログラムを実行し、問題との正誤を判断するAPI
require './lib/code_candy/judgement'

class Api::V1::JudgementController < Api::ApiController
  before_action :authenticate_user!

  def exec
    # 送られてきたパラメータを変数に格納
    language = params[:language]
    source_code = params[:source_code]
    id = params[:answer_id]

    # 提出されたコードを保存
    Code.create(
      code: source_code,
      language: language,
      user_id: current_user.id
    )

    judgement = CodeCandy::Judgement.new(language, source_code, id, current_user)
    result = judgement.exec

    render json: result
  end
end
