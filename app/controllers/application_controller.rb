class ApplicationController < ActionController::Base
  before_action :authenticate_user!

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
