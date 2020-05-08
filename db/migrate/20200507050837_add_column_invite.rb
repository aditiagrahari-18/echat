class AddColumnInvite < ActiveRecord::Migration[6.0]
  def change
    add_column :invites, :status, :string
  end
end
