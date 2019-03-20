# == Schema Information
#
# Table name: tweets
#
#  id         :bigint(8)        not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

require 'rails_helper'

RSpec.describe Tweet, type: :model, model: true  do
  before do
    @user = FactoryBot.create(:user)
  end

  it "bodyとuser_idに値が入っている時" do
    tweet = @user.tweets.create(
      body: "hoge",
    )
    expect(tweet).to(be_valid)
  end

  it "bodyに値が入っていない時はエラー" do
    tweet = @user.tweets.create(
      body: nil
    )
    expect(tweet).not_to(be_valid)
  end

  it "user_idに値が入っていない時はエラー" do
    tweet = Tweet.create(
      body: "hoge"
    )
    expect(tweet).not_to(be_valid)
  end

  it "bodyの文字列が120文字以上の時はエラー" do
    text = ""
    150.times do
      text += "hoge"
    end
    tweet = @user.tweets.create(
      body: text,
    )
    expect(tweet).not_to(be_valid)
  end
end
