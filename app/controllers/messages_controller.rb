class MessagesController < ApplicationController
  def index
    # => GET    /inbox
    @my_requests = current_user.requests.where(status: "Accepted")
    @incoming_requests = current_user.incoming_requests.where(status: "Accepted")
  end

  def new
    # => GET    /inbox/:user_id
    @message = Message.new
    @event = current_user.requests.where(status: "Accepted")
  end

  def create
    # => POST    /inbox
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    render :new
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
