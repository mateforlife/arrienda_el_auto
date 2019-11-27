class Fee < ApplicationRecord
  validates_presence_of %i[amount engine_type body_type]
end
