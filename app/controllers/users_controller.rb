class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    @invites = Invite.where(invited_to: current_user.id)
    @invitedusers = User.where(id: @invites.pluck(:invited_by))
  end

  def invites
    if Invite.where(invited_to: params[:invited_to], invited_by: current_user.id).present?
      flash[:danger] = "Already Invited"
      redirect_to users_index_path
    else
      invite = Invite.new
      invite.invited_to = params[:invited_to]
      invite.invited_by = current_user.id
      invite.invited = true
      invite.save!
      flash[:success] = "Invite has been sent"
      redirect_to users_index_path
    end
  end

  def accept_request
    @invite = Invite.find_by(invited_by: params[:user_id], invited_to: current_user.id)
    if @invite.update(status: "accepted")
      respond_to do |format|
        format.html { redirect_to users_index_path }
        format.js
      end

    else
        flash[:danger] = "Something went to wrong!"
        redirect_to users_index_path
    end
  end

end
