class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  use_growlyflash

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || courses_path
  end

  protected

  def set_search
    @q = Course.ransack(params[:q])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :profile_image, :profile_image_cache_id, :remove_profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :profile_image, :profile_image_cache_id, :remove_profile_image])
  end
end
