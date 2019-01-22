require 'twitter'

require './lib/twitter/twitter_client'

module Twitter
  class Bot < TwitterClient
    class << self
      def tweet(title)
        begin
          text = "【新作問題】\nCodeCandyに新しい問題を追加しました。\nタイトル: #{title}"
          # puts text
          client.update(text)
        rescue => e
          puts "== TWEET ERROR =="
          puts e
          puts "================="
        end
      end
    end
  end
end
