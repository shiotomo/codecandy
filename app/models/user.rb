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
end
