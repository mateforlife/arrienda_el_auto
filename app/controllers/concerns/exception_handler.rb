# frozen_string_literal: true

# ExceptionHandler
module ExceptionHandler
  extend ActiveSupport::Concern

  if Rails.env.production?
    included do
      rescue_from ActiveRecord::RecordNotFound do
        not_found
      end

      rescue_from ActiveRecord::RecordInvalid do
        not_found
      end

      rescue_from ActionController::RoutingError do
        not_found
      end

      rescue_from NoMethodError do
        internal_server_error
      end

      rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.html { redirect_to my_vehicles_path, notice: exception.message }
        end
      end
    end
  end

  private

  def not_found
    render file: "#{Rails.root}/public/404.png",
           layout: false, status: :not_found
  end

  def internal_server_error
    render file: "#{Rails.root}/public/500.html",
           layout: false, status: :internal_server_error
  end
end
