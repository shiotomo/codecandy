# == Schema Information
#
# Table name: category_items
#
#  id          :integer          not null, primary key
#  category_id :integer          not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe CategoryItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
