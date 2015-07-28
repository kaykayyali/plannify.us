# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:name => "Kaysser Kayyali", :first_name => "Kaysser", :last_name => "Kayyali", )

   t.string   "role"
    t.string   "email",                 
    t.string   "encrypted_password",     
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                        
    t.datetime "updated_at",                        
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "owner"
    t.string   "city"
    t.string   "state"
    t.decimal  "rating"