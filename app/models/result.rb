# == Schema Information
#
# Table name: results
#
#  id          :bigint(8)        not null, primary key
#  answer      :boolean          default(FALSE), not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#  code        :text
#  language    :string
#

class Result < ApplicationRecord
  belongs_to :question, inverse_of: :results
  belongs_to :user, inverse_of: :results

  def self.submit_code(question_id, user_id, language, source_code, answer_flag)
    create(
      answer: answer_flag,
      user_id: user_id,
      question_id: question_id,
      code: source_code,
      language: language
    )
  end
end
