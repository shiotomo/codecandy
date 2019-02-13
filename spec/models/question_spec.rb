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

require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryBot.create(:question)
  end

  context "問題を登録する時" do
    it "問題文だけ正常に登録できる" do
      @question.save
    end
  end
end
