# == Schema Information
#
# Table name: results
#
#  id          :bigint(8)        not null, primary key
#  answer      :boolean          default(FALSE), not null
#  user_id     :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint(8)        not null
#  code        :text
#  language    :string
#

require 'rails_helper'

RSpec.describe Result, type: :model do
  before do
    @question = create(:question, id: 1)
    @user = create(:user, id: 1)
  end

  it 'データをレコードできる' do
    answer = @user.results.new(
      answer: true,
      question_id: @question.id,
      code: 'puts 1',
      language: 'Ruby'
    )
    expect(answer).to(be_valid)
  end
end
