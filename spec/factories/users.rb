# == Schema Information
#
# Table name: users
#
#  id          :bigint(8)        not null, primary key
#  provider    :string
#  uid         :string
#  user_name   :string
#  screen_name :string
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_admin    :boolean          default(FALSE), not null
#  api_token   :string
#

FactoryBot.define do
  factory :user do
    provider { 'twitter' }
    uid { '12345654321' }
    user_name { 'hoge' }
    screen_name { 'hoge' }
    image_url { 'https://hoge.com/image' }
    is_admin { false }
  end

  factory :admin, class: User do
    provider { 'twitter' }
    uid { '12345654323' }
    user_name { 'piyo' }
    screen_name { 'piyo' }
    image_url { 'https://piyo.com/image' }
    is_admin { true }
  end
end
