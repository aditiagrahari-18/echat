class MessagesController < ApplicationController
  def create
    @message = Message.new(user_params)
    @message.sender_id = params[:sender_id]
    @message.reciever_id = params[:reciever_id]
    @message.save
    redirect_to root_path
  end

  private
  def user_params
    params.require(:message).permit(:msg_body)
  end
end
