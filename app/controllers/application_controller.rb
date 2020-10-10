class ApplicationController < ActionController::Base
  before_action :config_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday])
  end
end
