require 'twitter'

class Bot
  class << self
    def tweet(text)
      # api.home_timeline.each do |tweet|
      #   puts "--- " + tweet.user.name + " : " + tweet.user.screen_name + " ---"
      #   puts tweet.text
      # end
      # puts "--- My profile ---"
      # puts "Account ID : " + api.user.screen_name
      # puts "Account name : " + api.user.name
      # puts "Profile : " + api.user.description
      # print "Tweets : "
      # puts api.user.tweets_count
      puts "==="
      puts text
      puts "==="
      api.update("テストツイート")
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
