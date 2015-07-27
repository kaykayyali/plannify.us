class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.datetime :date 
    	t.string :zipcode
    	t.string :venue
    	t.string :state
    	t.string :city
    	t.string :address
    	


      t.timestamps null: false
    end
  end
end
