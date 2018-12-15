class Api::V1::UserController < Api::ApiController
  before_action :authenticate_user!

  # CodeCandyに登録してからAPIを実行した日時までの年の配列を返却する
  def period
    submit_yaer = current_user.created_at.strftime('%Y').to_i
    now_year = Date.today.strftime('%Y').to_i
    years = {
      submit: submit_yaer,
      now: now_year,
      range: now_year - submit_yaer
    }
    render json: years
  end
end
