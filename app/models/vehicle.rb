class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  belongs_to :user
  belongs_to :fee, required: false
  has_many :profile_images, as: :resource, dependent: :destroy
  accepts_nested_attributes_for :profile_images

  enum body_type: %i[citycar sedan]
  enum engine_type: %i[gasoline diesel]
  enum transmission: %i[manual automatic]
  validates_presence_of %i[year licence_plate engine_number chasis_number]

  before_create :associate_fee

  def attach_images(images = [])
    images.each do |image|
      profile_images.create!(image: image)
    end
  end

  def associate_fee
    fee = Fee.find_by(body_type: body_type, engine_type: engine_type)
    return errors.add(:fee, 'does not exist for your vehicle') if fee.nil?

    self.fee = fee
  end
end
