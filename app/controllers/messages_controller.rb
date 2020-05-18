class MessagesController < ApplicationController
  def create
    @user = User.find_by(id: msg_params[:reciever_id])
    @user.update(archived: false) if @user.archived
    @message = Message.new(msg_params)
    @message.sender_id = current_user.id
    @message.save
    @chatlist = Message.where(sender_id:current_user).or(Message.where(reciever_id:current_user)).order(created_at: :ASC)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private
  
  def msg_params
    params.require(:message).permit(:msg_body, :reciever_id)
  end
end
