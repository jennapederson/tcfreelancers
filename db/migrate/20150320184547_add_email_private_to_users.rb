class AddEmailPrivateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_private, :boolean, default: false
  end
end
