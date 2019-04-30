# == Schema Information
#
# Table name: tweets
#
#  id         :bigint(8)        not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#

FactoryBot.define do
  factory :tweet do
    type { "" }
    body { "MyString" }
  end
end
