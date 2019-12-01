class Brand < ApplicationRecord
  has_many :vehicle_models
  scope :brand_search, -> (search) { where("name LIKE ?", "#{search}%")}
end