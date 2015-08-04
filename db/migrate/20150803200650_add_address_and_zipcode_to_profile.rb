class AddAddressAndZipcodeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :address, :string
    add_column :profiles, :zipcode, :string
  end
end
