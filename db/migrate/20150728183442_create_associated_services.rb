class CreateAssociatedServices < ActiveRecord::Migration
  def change
    create_table :associated_services do |t|
    	t.references :service, index: true
    	t.references :user, index: true

      t.timestamps null: false
    end
  end
end
