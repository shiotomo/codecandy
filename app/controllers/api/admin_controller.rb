require './lib/twitter/admin_twitter'

class Api::AdminController < Api::ApiController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def tweet
    type = params[:tweet_type]
    body = params[:body]
    user_id = current_user.id

    # ツイートする文の生成
    text = "【#{type}】\n#{body}"

    # ツイート
    @result = Twitter::AdminTwitter.tweet(text)

    # ツイート出来たときのみDBにツイート内容を格納
    if @result[:is_success]
      Tweet.create(
        body: text,
        user_id: user_id
      )
    end

    render json: @result
  end
end
