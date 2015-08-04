class AddMessageToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :message, :string
  end
end
