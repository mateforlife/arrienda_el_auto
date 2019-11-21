class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :rut, uniqueness: true, if: proc { |usr| usr.rut.present? }
  validates :rut, rut: true, if: proc { |usr| usr.rut.present? }
  validates :rut, format: { with: /\A\d{1,3}(\.\d{3})*-[0-9K]\z/,
                            message: I18n.t('Formato inválido') },
                  if: proc { |usr| usr.rut.present? }

  enum permission: %i[basic admin]
end
