require 'spec_helper'
require './lib/twitter/admin_twitter'

RSpec.describe "admin_twitter" do
  context "test環境の時" do
    it "statusは'This environment is not production.'を返却する'", admin_twitter: true do
      result = Twitter::AdminTwitter.tweet("hoge")
      expect(result[:status]).to eq "This environment is not production."
    end

    it "is_successはfalseを返却する'", admin_twitter: true  do
      result = Twitter::AdminTwitter.tweet("hoge")
      expect(result[:is_success]).to eq false
    end
  end
end
