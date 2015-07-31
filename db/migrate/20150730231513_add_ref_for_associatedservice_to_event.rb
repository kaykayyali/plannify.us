class AddRefForAssociatedserviceToEvent < ActiveRecord::Migration
  def change
  	add_reference :events, :associated_service, index: true
  end
end
