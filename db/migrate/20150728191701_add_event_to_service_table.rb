class AddEventToServiceTable < ActiveRecord::Migration
  def change
  	 create_table :events_services, id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :service, index: true
    end
  end
end
