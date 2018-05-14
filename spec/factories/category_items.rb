# == Schema Information
#
# Table name: category_items
#
#  id          :integer          not null, primary key
#  category_id :integer          not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :category_item do
    category_id 1
    question_id 1
  end
end
