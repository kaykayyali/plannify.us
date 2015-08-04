class Addconfirmtoevents < ActiveRecord::Migration
  def change
  	add_column :events , :confirmed, :boolean
  end
end
