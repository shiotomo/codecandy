# == Schema Information
#
# Table name: category_items
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint(8)
#  question_id :bigint(8)
#

require 'rails_helper'

RSpec.describe CategoryItem, type: :model do
  before do
    @question = create(:question, id: 1)
    @category = create(:category, id: 1)
  end

  it 'データを登録できる' do
    category_item = CategoryItem.new(
      question_id: @question.id,
      category_id: @category.id
    )
    expect(category_item).to(be_valid)
  end

end
