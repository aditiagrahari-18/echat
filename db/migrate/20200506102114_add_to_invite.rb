class AddToInvite < ActiveRecord::Migration[6.0]
  def change
    add_column :invites, :invited, :boolean, default: false
  end
end
