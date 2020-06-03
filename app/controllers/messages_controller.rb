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
    @user = User.find(params[:user_id])
    
    if @user == @event.user
      @request = @event.requests.find_by(user: current_user)
    else
      @request = @event.requests.find_by(user: @user)
    end
    @messages = Message.where("(sender_id = :user AND receiver_id = :other_user) OR (sender_id = :other_user AND receiver_id = :user)", user: current_user, other_user: @user).order(created_at: :asc)
  end

  def create
    # => POST    /user/user_id/messages
    @user = User.find(params[:user_id])
    @message = Message.new(message_params)
    @message.receiver = @user
    @message.sender = current_user
    @event = Event.find(params[:event_id])
    if @message.save!
      UserChannel.broadcast_to(
        @user,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to new_message_path(@user, event: @event.id)
    else
      render :new
    end
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
