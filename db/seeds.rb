User.create!([
  {role: "vendor", email: "gvale014@fiu.edu", encrypted_password: "$2a$10$Yn0leZu6dWZWsEnKkrjyv.pZSIcKjWYq3eAi5zac893kQyKihrWk.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 9, current_sign_in_at: "2015-07-29 22:24:34", last_sign_in_at: "2015-07-29 21:18:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Gloria ", last_name: "Valencia", name: "MAC Parking", owner: nil, city: nil, state: nil, rating: nil},
  {role: "organizer", email: "kaykayyali@gmail.com", encrypted_password: "$2a$10$qkU6I/YTEzFaaxHqrQiNv.FkPYKtIP5.Fhwc.lP0N4woHUt4EkjWS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 15, current_sign_in_at: "2015-07-29 22:27:13", last_sign_in_at: "2015-07-29 22:22:49", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Kaysser", last_name: "Kayyali", name: nil, owner: nil, city: nil, state: nil, rating: nil},
  {role: "vendor", email: "bob@dole.com", encrypted_password: "$2a$10$su94TkycCr1PTicVXWbBIe6Rt5QCH6jNuM1qm2BGk2sK3/zY3eBJi", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-07-29 15:04:00", last_sign_in_at: "2015-07-29 15:04:00", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Bob", last_name: "Dole", name: nil, owner: "Catering R Us", city: nil, state: nil, rating: nil},
  {role: "vendor", email: "john@doe.com", encrypted_password: "$2a$10$u/P3xEFoKwrB2733E7WJkuU1KV7tuqFuL0Yqw/oVNZovkrmmbtlTC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-07-29 15:42:15", last_sign_in_at: "2015-07-29 15:23:13", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "John", last_name: "Doe", name: nil, owner: nil, city: nil, state: nil, rating: nil},
  {role: "organizer", email: "nizar@ironhack.com", encrypted_password: "$2a$10$FhjnUHtgdwgqNnkhA0iUKObEy6rU.cqXfW5OsSNHNcnT6YMN2h2HC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-07-29 19:25:42", last_sign_in_at: "2015-07-29 19:25:42", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Nizar's", last_name: "Khalife", name: "Flower R Us", owner: nil, city: nil, state: nil, rating: nil}
])
AssociatedService.create!([
  {service_id: 1, user_id: 1}
  {service_id: 3, user_id: 3}
  {service_id: 2, user_id: 1}
  {service_id: 4, user_id: 5}
])

Event.create!([
  {name: "Kaysser's Bday Bash", start_date: "2015-11-13 20:00:00", end_date: "2015-11-14 02:00:00", zipcode: "33162", venue: "Home", state: "FL", city: "N Miami Beach", address: "1795 NE 175th st", user_id: 3},
  {name: "Mama's Bday", start_date: "2015-12-13 20:00:00", end_date: "2015-12-14 02:00:00", zipcode: "33172", venue: "Club Space", state: "FL", city: "Miami", address: "311 N Miami Ave", user_id: 3},
  {name: "Ironhack BBQ", start_date: "2015-08-01 12:00:00", end_date: "2015-08-01 16:00:00", zipcode: "33162", venue: "Franco's House", state: "FL", city: "N Miami Beach", address: "1795 NE 175th st", user_id: 6}
])
Service.create!([
  {name: "Valet"},
  {name: "Lighting"},
  {name: "Catering"},
  {name: "Floral Design"}
])
