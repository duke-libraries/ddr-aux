class ApplicationController < ActionController::Base

  class_attribute :ability_class
  self.ability_class = Ability

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

  def current_ability
    @current_ability ||= ability_class.new(current_user)
  end

end
