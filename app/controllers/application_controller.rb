# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include ExceptionHandler
  include ApplicationHelper
  before_action :set_locale
  before_action :authenticate_user!
  before_action :user_status

  private

  def user_status
    return unless current_user


  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
