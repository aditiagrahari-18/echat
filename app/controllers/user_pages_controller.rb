class UserPagesController < ApplicationController
  def home
    users = User.where.not(id: current_user)
    @friend = Invite.where(status: 'accepted', invited_by: current_user)
    @friends = users.where(id: @friend.pluck(:invited_to))
  
  end
end
