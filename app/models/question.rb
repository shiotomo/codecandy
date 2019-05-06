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
  validates :title, { presence: true, uniqueness: true }

  has_many :results, dependent: :destroy, inverse_of: :question
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers, allow_destroy: true

  has_many :category_items
  has_many :categories, through: :category_items

  include FriendlyId
  friendly_id :title

  # 問題の提出数を返却する
  # hash[問題ID] = 問題解答数
  def self.counter
    answers = Answer.all
    return create_counter(answers)
  end

  # 問題のユーザごとの提出数を返却する
  # hash[問題ID] = 問題解答数
  #
  # 引数
  #   user_id: ユーザのID
  def self.result_counter(user_id)
    results = Result.where(user_id: user_id)
    return create_counter(results)
  end

  private

  # Questionモデルに紐付いている子テーブルのデータ数を返却(N + 1クエリ対策用)
  # hash[問題ID] = 問題解答数
  #
  # 引数
  #   answers 子テーブルのデータ
  def self.create_counter(answers)
    counter = {}
    questions = Question.all
    questions.each do |question|
      counter[:"#{question.id}"] = 0
    end
    answers.each do |answer|
      counter[:"#{answer.question_id}"] += 1
    end
    return counter
  end
end
