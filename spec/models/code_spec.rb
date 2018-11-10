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
  pending "add some examples to (or delete) #{__FILE__}"
end
