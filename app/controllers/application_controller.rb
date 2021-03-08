class ApplicationController < ActionController::Base
  before_action :configure_permittied_parameters, if: :devise_controller?

  private
  def configure_permittied_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile])
  end
end
