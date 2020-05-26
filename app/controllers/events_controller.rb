class EventsController < ApplicationController

  def index
    # => GET    /events
    if params[:query].present?
      sql_query = "name ILIKE :query OR event ILIKE :query"
      @events = policy_scope(Event).where(sql_query, query: "%#{params[:query]}%")
    else
      @events = policy_scope(Event)
    end
  end

  def show
    # => GET    /events/:id
  end

  def new
    # => GET    /events/new
    @event = Event.new
    authorize @event
  end

  def create
    # => POST   /events
    @event = Event.new(event_params)
    authorize @event
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
    authorize @event
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:photo, :name, :user, :category, :address)
  end

end
