class Question < ApplicationRecord
  validates :title, presence: true

  has_many :results, dependent: :destroy
  has_many :question_programs, dependent: :destroy
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers, allow_destroy: true
end
