# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Question < ApplicationRecord
  validates :title, presence: true

  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers, allow_destroy: true

  has_many :category_items
  has_many :categories, through: :category_items
end
