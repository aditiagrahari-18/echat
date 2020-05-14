class MessagesController < ApplicationController

  def create
    @message = Message.new(user_params)
    @message.sender_id = params[:sender_id]
    @message.reciever_id = params[:reciever_id]
    @message.save
    respond_to do |format|
    format.html { redirect_to root_path }
    format.js
    end
  end

  private
  def user_params
    params.require(:message).permit(:msg_body)
  end
end
