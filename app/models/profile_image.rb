# frozen_string_literal: true

# ProfileImage
class ProfileImage < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_one_attached :image

  #todo: add validation to image file time
end
