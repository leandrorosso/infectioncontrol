class ApplicationController < ActionController::Base

  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[name username]
  end

  def user_not_authorized
    redirect_to root_path
  end
end
