class AddLinkedInFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :headline, :string
    add_column :users, :profile_url, :string
    add_column :users, :profile_image, :string
  end
end
