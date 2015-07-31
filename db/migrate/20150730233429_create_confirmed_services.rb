class CreateConfirmedServices < ActiveRecord::Migration
  def change
    create_table :confirmed_services do |t|
    	t.references :event, index: true
    	t.references :associated_service, index: true
      t.timestamps null: false
    end
  end
end
