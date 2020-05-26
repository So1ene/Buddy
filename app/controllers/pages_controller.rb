class PagesController < ApplicationController

  def home
    # => GET    /
    @user = current_user
    if @user.search_location == "" || @user.search_location == nil
      redirect_to welcome_path
    end
    @events = Event.all
  end

  def welcome
    # => GET    /welcome
    @user = current_user
  end

  def update_location
    # => PATCH    /
    current_user.update(user_params)
    redirect_to root_path
  end

  def buddy
    # => GET    /buddy
  end

  def calendar
    # => GET    /calendar
  end

  private

  def user_params
    params.require(:user).permit(:search_location)
  end
end
