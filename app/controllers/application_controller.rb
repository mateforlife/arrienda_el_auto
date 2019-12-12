class ApplicationController < ActionController::Base
  include ExceptionHandler
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :second_last_name, :rut, :phone_number, :birthdate, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :second_last_name, :rut, :phone_number, :birthdate, :gender])
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
