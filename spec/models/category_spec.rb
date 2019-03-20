# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :text
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'データを登録できる' do
    category = create(:category, id: 1)
    expect(category).to(be_valid)
  end

  it 'タイトルがない場合データを登録できない' do
      category = Question.new(
        title: '',
        body: ''
      )
      expect(category).not_to(be_valid)
  end
end
