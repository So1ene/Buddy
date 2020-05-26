class EventsController < ApplicationController

  def index
    # => GET    /events
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
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def delete
    # => GET    /events/:id/delete
    @events = Event.all
    set_event
  end

  def destroy
    # => DELETE /events/:id
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:photo, :name, :user, :category, :address)
  end

end
