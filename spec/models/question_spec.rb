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
  end

  context '問題を登録する時' do
    it '問題文だけ正常に登録できる' do
      question = Question.new(
        title: 'hoge',
        body: ''
      )
      expect(question).to(be_valid)
    end

    it 'タイトルが空の場合はレコードできない' do
      question = Question.new(
        title: '',
        body: ''
      )
      expect(question).not_to(be_valid)
    end
  end
end
