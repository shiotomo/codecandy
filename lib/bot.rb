require 'twitter'

class Bot
  class << self
    def tweet(title)
      begin
        text = "【お知らせ】\nCodeCandyに新しい問題を追加しました。\nタイトル: #{title}"
        api.update(text)
      rescue => e
        puts "== TWEET ERROR =="
        puts e
        puts "================="
      end
    end

    private
    def api
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
      end

      return client
    end
  end
end
