# == Schema Information
#
# Table name: results
#
#  id          :integer          not null, primary key
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
end
