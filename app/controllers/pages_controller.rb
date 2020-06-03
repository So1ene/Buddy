class PagesController < ApplicationController

  def home
    # => GET    /
    @user = current_user
    if @user == nil || @user.search_location == "" || @user.search_location == nil
      redirect_to welcome_path
    end
    @events = Event.near(current_user.search_location, 25).includes(:categories, :user).with_attached_photo
    @categories = Category.all
    @search_results = Event.where("name ILIKE ?", "%#{params[:query]}%").includes(:categories, :user).with_attached_photo
    if params[:categories].present?
      @events = @events.joins(:categories).where(categories: {name: params[:categories]})
    end
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
    if params[:categories].present?
      @events = @events.select do |event|
        params[:categories].include?(event.categories.first.name || event.categories.second.name || event.categories.third.name)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:search_location)
  end
end
