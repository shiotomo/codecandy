class Code < ApplicationRecord
  belongs_to :user, inverse_of: :codes
end
