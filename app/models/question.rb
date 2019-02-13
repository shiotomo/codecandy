# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :results, dependent: :destroy, inverse_of: :question
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers, allow_destroy: true

  has_many :category_items
  has_many :categories, through: :category_items

  include FriendlyId
  friendly_id :title
end
