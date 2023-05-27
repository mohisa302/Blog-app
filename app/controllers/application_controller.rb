class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def after_sign_out_path_for(_use_or_resource_or_scope)
    new_user_session_path
  end

  protected
  def authenticate_user!
    return if request_from_localhost? # Allow requests from localhost without authentication
    super # Call the default implementation for non-localhost requests
  end

  def verified_request?
    super || request_from_localhost?
  end

  def request_from_localhost?
    request.remote_ip == '127.0.0.1' || request.remote_ip == '::1'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name bio password password_confirmation])
  end
end
