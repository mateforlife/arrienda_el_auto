# frozen_string_literal: true

# ProfileImage
class ProfileImage < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_one_attached :file, dependent: :destroy

  validates :file, attached: true,
                   content_type: ['image/png', 'image/jpg', 'image/jpeg']

  ATTACHMENTS_LIMIT = 5
end
