require './lib/twitter/admin_twitter'

class Api::AdminController < Api::ApiController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def tweet
    type = params[:tweet_type]
    body = params[:body]
    user_id = current_user.id

    text = "【#{type}】\n#{body}"

    if Rails.env == 'production'
      @result = Twitter::AdminTwitter.tweet(text)
      if @result[:is_success]
        Tweet.create(
          body: text,
          user_id: user_id
        )
      end
    else
      @result = {
        status: "This environment is not production.",
        is_success: false
      }
    end

    render json: @result
  end
end
