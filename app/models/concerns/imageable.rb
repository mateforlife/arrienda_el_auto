# frozen_string_literal: true

# Imageable
module Imageable
  extend ActiveSupport::Concern

  included do
    validates :images, attached: true,
                       content_type: ['image/png', 'image/jpg', 'image/jpeg']
  end
end
