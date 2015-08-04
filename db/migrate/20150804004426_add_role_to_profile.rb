class AddRoleToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :servce_type, :string
  end
end
