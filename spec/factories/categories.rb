# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :text
#

FactoryBot.define do
  factory :category do
    title "MyString"
  end
end
