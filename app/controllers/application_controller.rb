class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, with: :forbidden
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render file: "#{Rails.root}/public/404", formats: [:html], status: 404, layout: false
  end

  def forbidden
    render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

end
