class PagesController < ApplicationController

  def home
    # => GET    /
    @user = current_user
    if @user == nil || @user.search_location == "" || @user.search_location == nil
      redirect_to welcome_path
    end
    @events = Event.all
    @categories = Category.all
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
    # => GET    /buddy/:user_id
  end

  def calendar
    # => GET    /calendar

    # !!! Do not touch this, it works somehow !!!

    requests = []
    requests << Request.where(status: "Accepted", user: current_user)
    current_user.events.each do |event|
      requests << event.requests.where(status: "Accepted")
    end
    @events = requests.flatten.map do |request|
      request.event
    end
  end

  private

  def user_params
    params.require(:user).permit(:search_location)
  end
end
