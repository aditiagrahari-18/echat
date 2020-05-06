class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.integer :invited_by
      t.integer :invited_to

      t.timestamps
    end
  end
end
