class FixColumnDateTimeEvent < ActiveRecord::Migration
  def change
  	remove_column :events, :date
  	add_column :events, :date, :date
  	add_column :events, :time, :time
  end
end
