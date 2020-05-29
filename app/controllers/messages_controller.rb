class MessagesController < ApplicationController
  def index
    # => GET    /inbox
    @my_requests = current_user.requests.where(status: "Accepted")
    @incoming_requests = current_user.incoming_requests.where(status: "Accepted")
  end

  def new
    # => GET    /inbox/:user_id
    @message = Message.new
    @event = Event.find(params[:event])
  end

  def create
    # => POST    /inbox
    #@chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    #@message.chatroom = @chatroom
    @message.user = current_user
    #if @message.save
      #redirect_to chatroom_path(@chatroom)
    #else
      #render "inbox/new"
    #end
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
