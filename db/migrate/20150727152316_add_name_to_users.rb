class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :name, :string
    add_column :users, :owner, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :rating, :decimal
  end
end
