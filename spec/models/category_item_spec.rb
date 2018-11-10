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
  # pending "add some examples to (or delete) #{__FILE__}"
end
