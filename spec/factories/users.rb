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
end
