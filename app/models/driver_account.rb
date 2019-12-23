# frozen_string_literal: true

# DriverAccount
class DriverAccount < ApplicationRecord
  include Documentable
  belongs_to :user
  has_many :legal_documents, as: :resource
  enum status: %i[created review approved rejected]

  validate :one_driver_account_per_user, on: :create
  scope :active, -> { where(status: 'approved') }

  REQUIRED_DOCUMENTS = %w[driver_license driver_resume].freeze

  def set_status!
    return approved! if legal_documents_effective? && (review? || status.nil?)

    return review! if created? || status.nil?
  end

  private

  def one_driver_account_per_user
    current_user_driver_account = DriverAccount.find_by(user: user)
    return unless current_user_driver_account

    errors.add(:user, 'already has a driver_account')
  end
end
