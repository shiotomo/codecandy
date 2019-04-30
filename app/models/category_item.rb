# == Schema Information
#
# Table name: category_items
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint(8)        not null
#  question_id :bigint(8)        not null
#

class CategoryItem < ApplicationRecord
  belongs_to :category
  belongs_to :question
end
