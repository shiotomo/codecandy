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

FactoryBot.define do
  factory :code do
    user_id { 1 }
    code { "puts 1" }
    language { "Ruby" }
  end
end
