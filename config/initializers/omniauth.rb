Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    ENV['TWITTER_CONSUMER_KEY'],
    ENV['TWITTER_CONSUMER_SECRET']
  provider :github,
    ENV['GITHUB_KEY'],
    ENV['GITHUB_SECRET']
end
