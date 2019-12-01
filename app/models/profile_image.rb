# frozen_string_literal: true

# ProfileImage
class ProfileImage < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_one_attached :image

  validates :image, attached: true,
                    content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
