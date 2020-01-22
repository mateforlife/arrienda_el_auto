# frozen_string_literal: true

# City
class City < ApplicationRecord
  belongs_to :state
  has_many :addresses
end
