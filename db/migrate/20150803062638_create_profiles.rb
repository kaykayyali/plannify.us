class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.references :user, index: true
    	  	t.string 	:first_name
		  	t.string 	:owner
		  	t.string 	:city
		  	t.string 	:state
		  	t.string 	:weburl
		  	t.string 	:last_name
		  	t.string 	:name
		  	t.string 	:email
		  	t.string 	:phone
		  	t.string 	:imageurl
		  	t.decimal 	:rating

      t.timestamps null: false
    end
  end
end
