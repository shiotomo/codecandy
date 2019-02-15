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

class Category < ApplicationRecord
  validates :title, {presence: true, uniqueness: true}

  has_many :category_items
  has_many :questions, through: :category_items, dependent: :destroy

  accepts_nested_attributes_for :questions
  # has_many :category_items

  include FriendlyId
  friendly_id :title
end
