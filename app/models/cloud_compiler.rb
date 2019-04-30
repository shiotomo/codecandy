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

class CloudCompiler < ApplicationRecord
  belongs_to :user, inverse_of: :cloud_compilers

  # 全ユーザのコードの提出数を返却する
  # hash[ユーザID] = コードの数
  def self.counter
    counter = {}
    codes = CloudCompiler.all
    users = User.all
    users.each do |user|
      counter[:"#{user.id}"] = 0
    end
    codes.each do |code|
      counter[:"#{code.user_id}"] += 1
    end
    return counter
  end
end
