class AddDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :email, :string, null: false
    add_column :users, :avatar, :string, null: false
    add_column :users, :links, :text, null: false
    add_column :users, :location, :string
  end
end
