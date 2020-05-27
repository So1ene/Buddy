class MessagesController < ApplicationController
  def index
    # => GET    /inbox
    @messages = Message.where("sender_id = :user or receiver_id = :user", user: current_user.id).order(created_at: :desc).to_a.uniq do |message|
      message.other_user(current_user)
    end
  end

  def new
    # => GET    /inbox/:user_id
    @message = Message.new
    # @event =
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
