# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  provider    :string
#  uid         :string
#  user_name   :string
#  screen_name :string
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_admin    :boolean          default(FALSE), not null
#

class User < ApplicationRecord
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
      image_url: auth["info"]["image"]
    )
  end

  include FriendlyId
  friendly_id :screen_name
end
