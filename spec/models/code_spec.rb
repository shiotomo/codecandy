# == Schema Information
#
# Table name: codes
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  code       :text
#  language   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Code, type: :model do
  it 'データをレコードできる' do
    user = create(:user, id: 1)
    code = user.codes.new(
      code: 'puts 1',
      language: 'Ruby'
    )
    expect(code).to(be_valid)
  end
end
