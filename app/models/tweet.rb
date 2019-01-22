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

class Tweet < ApplicationRecord
  validates :body, presence: true
  validates :user_id, presence: true
  validates :body, length: { maximum: 120 }
end

