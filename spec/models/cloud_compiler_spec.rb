# == Schema Information
#
# Table name: cloud_compilers
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  code       :text
#  language   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CloudCompiler, type: :model do
  it 'データをレコードできる' do
    user = create(:user, id: 1)
    cloud_compiler = user.cloud_compilers.new(
      code: 'puts 1',
      language: 'Ruby',
      input: ''
    )
    expect(cloud_compiler).to(be_valid)
  end
end
