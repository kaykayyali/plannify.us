class FixMessageRead < ActiveRecord::Migration
  def change
  	change_column :messages, :read, :boolean, default: false
  end
end
