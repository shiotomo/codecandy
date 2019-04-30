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

class User < ApplicationRecord
  has_many :results, inverse_of: :user
  has_many :codes, inverse_of: :user
  has_many :cloud_compilers, inverse_of: :user
  has_many :tweets, inverse_of: :user

  include FriendlyId
  friendly_id :screen_name

  has_secure_token :api_token

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.user_name = auth["info"]["name"]
      user.screen_name = auth["info"]["nickname"]
      user.image_url = auth["info"]["image"]
    end
  end

  def self.update_with_omniauth(user, auth)
    user.update_attributes!(
      provider: auth["provider"],
      uid: auth["uid"],
      user_name: auth["info"]["name"],
      screen_name: auth["info"]["nickname"],
      image_url: auth["info"]["image"],
      updated_at: Time.current
    )
  end
end
