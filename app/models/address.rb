# frozen_string_literal: true

# Address
class Address < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates_presence_of %i[street street_number]

  before_save :trim_and_capitalize_attributes

  private

  def trim_and_capitalize_attributes
    %i[street street_number apartment].each do |attribute|
      if self[attribute].present?
        self[attribute] = self[attribute].downcase.strip.titleize
      end
    end
  end
end
