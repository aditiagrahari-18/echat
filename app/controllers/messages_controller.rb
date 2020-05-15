class MessagesController < ApplicationController
  def create
    @user = User.where(id: params[:sender_id]).or(User.where(id: params[:reciever_id]))
    if @user.where(archived: true)
    @user.update(archived: false)
    @message = Message.new(user_params)
    @message.sender_id = params[:sender_id]
    @message.reciever_id = params[:reciever_id]
    @message.save
    respond_to do |format|
    format.html { redirect_to root_path }
    format.js
    end
  else
    @message = Message.new(user_params)
    @message.sender_id = params[:sender_id]
    @message.reciever_id = params[:reciever_id]
    @message.save
      respond_to do |format|
          format.html { redirect_to root_path }
          format.js
      end
    end
  end

  private
  def user_params
    params.require(:message).permit(:msg_body)
  end
end
