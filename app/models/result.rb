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

  # 全ユーザのコードの問題解答数を返却する
  # hash[ユーザID] = 問題解答数
  def self.counter
    counter = {}
    results = Result.all
    users = User.all
    users.each do |user|
      counter[:"#{user.id}"] = 0
    end
    results.each do |result|
      counter[:"#{result.user_id}"] += 1
    end
    return counter
  end
end
