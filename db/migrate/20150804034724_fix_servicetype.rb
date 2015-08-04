class FixServicetype < ActiveRecord::Migration
  def change
  	remove_column :profiles, :role
  	remove_column :profiles, :servce_type
  	add_column :profiles, :service_type, :string
  end
end
