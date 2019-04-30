# == Schema Information
#
# Table name: answers
#
#  id          :bigint(8)        not null, primary key
#  input       :text
#  output      :text
#  question_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @question = create(:question, id: 1)
  end

  it 'データを登録できる' do
    answer = @question.answers.new(
      input: "",
      output: "hoge"
    )
    expect(answer).to(be_valid)
  end
end
