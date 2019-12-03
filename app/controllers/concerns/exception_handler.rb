module ExceptionHandler
  extend ActiveSupport::Concern

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
      not_found
    end

    # rescue_from CanCan::AccessDenied do |exception|
    #   json_api_response({ message: exception.to_s, resource: exception.subject.model_name
    #       .singular.to_sym }, status: :forbidden, resource_name: :permission)
    # end
  end

  def not_found
    render file: "#{Rails.root}/public/404.png", layout: false, status: :not_found
  end
end
