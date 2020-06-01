class EventsController < ApplicationController

  def index
    # => GET    /events
    @user = current_user
    if @user == nil || @user.search_location == "" || @user.search_location == nil
      redirect_to welcome_path
    end
    @events = Event.all
  end

  def show
    # => GET    /events/:id
    @event = Event.find(params[:id])
  end

  def new
    # => GET    /events/new
    @event = Event.new
  end

  def create
    # => POST   /events
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.categories == []
      EventCategory.create(event: @event, category: Category.find_by(name: "outdoors"))
    end
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def delete
    # => GET    /events/:id/delete
    @event = Event.find(params[:id])
    @event.destroy!
  end

  def destroy
    # => DELETE /events/:id
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def my_events
    # => GET    /events/pending, prefix: my_events
    @events = current_user.events
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:photo, :name, :user, :category, :address, :date_time, :description)
  end

end
