# == Schema Information
#
# Table name: users
#
#  id          :bigint(8)        not null, primary key
#  provider    :string
#  uid         :string
#  user_name   :string
#  screen_name :string
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_admin    :boolean          default(FALSE), not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザを登録できる" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end
end
