class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :age, :bio, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :bio, :photo, {language_ids: []}])
  end

  def after_sign_in_path_for(resource)
    if current_user.search_location.nil?
      welcome_path
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    if current_user.search_location.nil?
      welcome_path
    else
      root_path
    end
  end

  def stored_locations_for(resource)
  end

end
