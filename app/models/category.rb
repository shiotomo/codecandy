# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  validates :title, presence: true

  has_many :category_items
  has_many :questions, through: :category_items

  accepts_nested_attributes_for :questions
  # has_many :category_items
end
