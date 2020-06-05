class EventsController < ApplicationController

  def index
    # => GET    /events
    @user = current_user
    if @user == nil || @user.search_location == "" || @user.search_location == nil
      redirect_to welcome_path
    end
    @events = Event.all
    if params[:date].present?
      @date = params[:date]
      @events = @events.where('date_time BETWEEN ? AND ?', DateTime.parse(params[:date]).beginning_of_day, DateTime.parse(params[:date]).end_of_day).where("address ILIKE ?", "%#{@user.search_location}%").includes(:categories, :user).with_attached_photo
    end
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
    if params[:event][:category_ids].length != 0 && params[:event][:category_ids].length < 4 && @event.save
      category_ids = params[:event][:category_ids]
      category_ids.each do |catetogy_id|
        EventCategory.create(category_id: catetogy_id, event_id: @event.id)
      end
      redirect_to event_path(@event)
    else
      @event.valid?
      p params[:event][:category_ids]
      flash[:notice] = "Please select up to 3 categories" if params[:event][:category_ids].length > 3 || params[:event][:category_ids].length == 0
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
