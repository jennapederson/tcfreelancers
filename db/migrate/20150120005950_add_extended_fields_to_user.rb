class AddExtendedFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :description, :string
    add_column :users, :available_for_hire, :boolean
    add_column :users, :twitter_handle, :string
  end
end
