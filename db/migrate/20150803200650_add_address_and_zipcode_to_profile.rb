class AddAddressAndZipcodeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :address, :string
    add_column :profiles, :zipcode, :string
    add_column :profiles, :role, :string
  end
end
