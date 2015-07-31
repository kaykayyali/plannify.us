class FixAssociations < ActiveRecord::Migration
  def change
  	remove_reference :events, :associated_service
  end
end
