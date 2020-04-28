class AddColumnTermsAndConditionsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :terms_and_conditions, :boolean
  end
end
