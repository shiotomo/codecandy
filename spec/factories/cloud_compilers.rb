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

FactoryBot.define do
  factory :cloud_compiler do
    user_id { 1 }
    code { "MyText" }
    language { "MyString" }
  end
end
