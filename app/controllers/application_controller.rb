# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include ExceptionHandler
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: devise_extra_params)
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: devise_extra_params)
  end

  private

  def devise_extra_params
    [
      :first_name, :last_name, :second_last_name,
      :rut, :phone_number, :birthdate, :gender,
      address_attributes: [
        :city_id, :street, :street_number, :apartment
      ]
    ]
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
