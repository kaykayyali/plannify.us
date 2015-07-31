User.create!([
  {role: "vendor", email: "gvale014@fiu.edu", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 9, current_sign_in_at: "2015-07-29 22:24:34", last_sign_in_at: "2015-07-29 21:18:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Gloria", last_name: "Valencia", name: "MAC Parking", owner: "Emad Kayyali", city: "Miami", state: "FL", rating: 4},
  {role: "organizer", email: "kaykayyali@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 15, current_sign_in_at: "2015-07-29 22:27:13", last_sign_in_at: "2015-07-29 22:22:49", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Kaysser", last_name: "Kayyali", name: nil, owner: "Kaysser Kayyali", city: "Miami", state: "FL", rating: 2},
  {role: "vendor", email: "bob@dole.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-07-29 15:04:00", last_sign_in_at: "2015-07-29 15:04:00", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Bob", last_name: "Dole", name: "Catering R Us", owner: "Bob Dole" , city: "Miami", state: "FL", rating: 1},
  {role: "vendor", email: "john@doe.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-07-29 15:42:15", last_sign_in_at: "2015-07-29 15:23:13", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "John", last_name: "Doe", name: "Doe Inc.", owner: "John Doe", city: "Miami", state: "FL", rating: 4},
  {role: "vendor", email: "nizar@ironhack.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-07-29 19:25:42", last_sign_in_at: "2015-07-29 19:25:42", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Nizar", last_name: "Khalife", name: "Flowers R Us", owner: "Nizar Khalife", city: "Miami", state: "FL", rating: 3},
  {role: "vendor", email: "andrew@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 9, current_sign_in_at: "2015-07-29 22:24:34", last_sign_in_at: "2015-07-29 21:18:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Andrew", last_name: "Ettinger", name: "Apollo Jets", owner: "Bill Cosby", city: "Ft. Myers", state: "FL", rating: 4},
  {role: "organizer", email: "josh@ironhack.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 15, current_sign_in_at: "2015-07-29 22:27:13", last_sign_in_at: "2015-07-29 22:22:49", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Josh", last_name: "Alexy", name: "Sandwich.sexy", owner: "Paul Castranovo", city: "Davie", state: "FL", rating: 2},
  {role: "vendor", email: "ariel@ironhack.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-07-29 15:04:00", last_sign_in_at: "2015-07-29 15:04:00", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Ariel", last_name: "Quinones", name: "Ironhack", owner: "Ron Burgundy" , city: "Hialeah", state: "FL", rating: 1},
  {role: "vendor", email: "yannick@ironhack.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-07-29 15:42:15", last_sign_in_at: "2015-07-29 15:23:13", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Yannick", last_name: "Calleiro", name: "Gighub", owner: "Robert Herjaveck", city: "Coral Gables", state: "FL", rating: 4},
  {role: "vendor", email: "michael@ironhack.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-07-29 19:25:42", last_sign_in_at: "2015-07-29 19:25:42", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Michael", last_name: "Emma", name: "St. Lucie Commons", owner: "Mark Cuban", city: "Miami Beach", state: "FL", rating: 3}
])
AssociatedService.create!([
  {service_id: 1, user_id: 1},
  {service_id: 3, user_id: 3},
  {service_id: 2, user_id: 4},
  {service_id: 4, user_id: 5},
  {service_id: 1, user_id: 6},
  {service_id: 3, user_id: 8},
  {service_id: 2, user_id: 9},
  {service_id: 4, user_id: 10}
])

Event.create!([
  {name: "Kaysser's Bday Bash", start_date: "2015-11-13 20:00:00", end_date: "2015-11-14 02:00:00", zipcode: "33162", venue: "Home", state: "FL", city: "N Miami Beach", address: "1795 NE 175th st", user_id: 2},
  {name: "Mama's Bday", start_date: "2015-12-13 20:00:00", end_date: "2015-12-14 02:00:00", zipcode: "33172", venue: "Club Space", state: "FL", city: "Miami", address: "311 N Miami Ave", user_id: 2},
  {name: "Ironhack BBQ", start_date: "2015-08-01 12:00:00", end_date: "2015-08-01 16:00:00", zipcode: "33162", venue: "Franco's House", state: "FL", city: "N Miami Beach", address: "1795 NE 175th st", user_id: 2}
])
Service.create!([
  {name: "Valet"},
  {name: "Lighting"},
  {name: "Catering"},
  {name: "Floral Design"}
])
