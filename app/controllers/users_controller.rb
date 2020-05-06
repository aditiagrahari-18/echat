class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    @invites = Invite.where(invited_to: current_user.id)
    @invitedusers = User.where(id: @invites.pluck(:invited_by))

  end

  def invites
    #if Invite.where(invited_by: current_user.id)
    #if Invite.exists?(invited: true)
    #if Invite.where(invited: true)
    if Invite.where(invited_to: params[:invited_to], invited_by: current_user.id).present?
      flash[:danger] = "Already sent"
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

end
