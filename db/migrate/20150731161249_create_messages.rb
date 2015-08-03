class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string :from_id
    	t.string :to_id
    	t.text :content
    	t.boolean :read

      t.timestamps null: false
    end
  end
end
