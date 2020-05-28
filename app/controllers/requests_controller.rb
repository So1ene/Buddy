class RequestsController < ApplicationController

  def new
    # => GET    /requests/new
    @event = Event.find(params[:event_id])
    @request = Request.new
  end

  def create
    # => POST   /requests
    @event = Event.find(params[:event_id])
    @new_request = Request.new(request_params)
    @new_request.status = "Pending..."
    @new_request.event = @event

    @new_request.user = current_user
    if @new_request.save
      # to change later
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    # => PATCH  /requests/:id
    @request = Request.find(params[:id])
    if ["Accepted", "Declined", "Deleted"].include?(status_params[:status])
      @request.status = status_params[:status]
      @request.save!
      if status_params[:status] == "Accepted"
        Message.create(sender: current_user, receiver: request.user, content: "Your request has been accepted! Lets start planning :) (this is an automated message)")
      end
    end
    session[:return_to] = request.referer
    redirect_to session.delete(:return_to)
  end

  def submitted
    # => GET    /requests/submitted
    @requests = Request.where(user: current_user)
  end

  def incoming
    # => GET    /requests/incoming
    events = current_user.events
    array = events.map { |event| event.requests }
    @requests = array.flatten
  end

  def show
    # => GET    /requests/:id
    @request = Request.find(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:motivation)
  end

  def status_params
    params.require(:request).permit(:status)
  end

end
