class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	
    	t.string :zipcode
    	t.string :venue
    	t.string :state
    	t.string :city
    	t.string :address
      t.references :user, index: true
    	


      t.timestamps null: false
    end
  end
end
