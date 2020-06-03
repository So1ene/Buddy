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
    session[:return_to] = request.referer
    redirect_to_path = session.delete(:return_to)
    @request = Request.find(params[:id])
    if ["Accepted", "Declined", "Deleted"].include?(status_params[:status])
      @request.status = status_params[:status]
      @request.save!
      if status_params[:status] == "Accepted"
        Message.create(sender: current_user, receiver: @request.user, content: "Your request has been accepted! Lets start planning :)")
        @request.event.requests.where(status: "Pending").update_all(status: "Declined")
        redirect_to_path =  new_message_path(@request.user, {event: @request.event.id} )
      end
    end
    
    redirect_to redirect_to_path
  end

  def submitted
    # => GET    /requests/submitted
    @requests = Request.where(user: current_user)
  end

  def incoming
    # => GET    /events/:event_id/requests/incoming
    event = Event.find(params[:event_id])
    @requests = event.requests
  end

  def show
    # => GET    /requests/:id
    @request = Request.find(params[:id])
  end

  def delete
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to submitted_request_path
  end

  private

  def request_params
    params.require(:request).permit(:motivation)
  end

  def status_params
    params.require(:request).permit(:status)
  end

end
