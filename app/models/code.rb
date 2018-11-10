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

class Code < ApplicationRecord
  belongs_to :user, inverse_of: :codes
end
