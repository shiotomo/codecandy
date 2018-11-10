# == Schema Information
#
# Table name: results
#
#  id          :bigint(8)        not null, primary key
#  answer      :boolean          default(FALSE), not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#  code        :text
#  language    :string
#

require 'rails_helper'

RSpec.describe Result, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
