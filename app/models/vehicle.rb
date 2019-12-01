class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  belongs_to :user
  belongs_to :fee, required: false
  has_many :profile_images, as: :resource, dependent: :destroy
  accepts_nested_attributes_for :profile_images
  attr_accessor :images

  # ====================
  # =     ENUMS        =
  # ====================
  enum body_type: %i[citycar sedan]
  enum engine_type: %i[gasoline diesel]
  enum transmission: %i[manual automatic]
  enum steering: %i[mechanical power electric]
  enum drive: %w[4x2 4x4]

  # ====================
  # =   VALIDATORS     =
  # ====================
  # validates_presence_of %i[year license_plate engine_number chasis_number]
  # validates :year, length: { is: 4 }
  # validates :license_plate, length: { is: 6 }
  # validates :odometer, length: { in: 1..7 }

  # ====================
  # =    CALLBACKS     =
  # ====================
  before_create :associate_fee
  before_save :upcase_license_plate

  # ====================
  # =      SCOPES      =
  # ====================
  scope :available, -> { where(visible: true) }
  scope :not_from_current_user, ->(current_user) { where.not(user: current_user) }

  # ====================
  # = INSTANCE METHODS =
  # ====================
  def upcase_license_plate
    self.license_plate = license_plate.upcase
  end

  def belongs_to_current_user?(current_user)
    user == current_user
  end

  def brand_and_model
    "#{vehicle_model.brand.name} #{vehicle_model.name}"
  end

  def save_with_images
    ActiveRecord::Base.transaction do
      save
      images.each do |image|
        profile_images.create!(image: image)
      rescue ActiveRecord::RecordInvalid => e
        errors.add(:profile_images, e)
      end
      raise ActiveRecord::Rollback if errors.count.positive?

      true
    end
  end

  def associate_fee
    fee = Fee.find_by(body_type: body_type, engine_type: engine_type)
    return errors.add(:fee, 'does not exist for your vehicle') if fee.nil?

    self.fee = fee
  end

  # ====================
  # =  CLASS METHODS   =
  # ====================
end
