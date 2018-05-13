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

class CategoryItem < ApplicationRecord
  belongs_to :category
end
