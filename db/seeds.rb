User.create!([
  {role: "organizer", email: "kaykayyali@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 10, current_sign_in_at: "2015-08-04 21:17:04", last_sign_in_at: "2015-08-04 21:08:59", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Kaysser", last_name: "Kayyali"},
  {role: "vendor", email: "gvale014@fiu.edu", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-08-04 21:25:51", last_sign_in_at: "2015-08-04 21:10:39", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Gloria", last_name: "Valencia"},
  {role: "organizer", email: "nizar@ironhack.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 10, current_sign_in_at: "2015-08-04 21:17:04", last_sign_in_at: "2015-08-04 21:08:59", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Nizar", last_name: "Khalife"},
  {role: "vendor", email: "josh@ironhack.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-08-04 21:25:51", last_sign_in_at: "2015-08-04 21:10:39", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Josh", last_name: "Alexy"}
])
AssociatedService.create!([
  {service_id: 4, user_id: 2},
  {service_id: 6, user_id: 4}
])
ConfirmedService.create!([
  {event_id: 1, associated_service_id: 1},
  {event_id: 5, associated_service_id: 1}
])
Event.create!([
  {name: "Kaysser's Bday Bash", start_date: "2015-11-13 20:00:00", end_date: "2015-11-14 02:00:00", zipcode: "33162", venue: "Home", state: "FL", city: "Miami", address: "1795 NE 175th st", guestcount: 50, user_id: 1, confirmed: false},
  {name: "Amy's Wedding", start_date: "2015-08-08 16:45:00", end_date: nil, zipcode: "33133", venue: "Villa Woodbine", state: "FL", city: "Miami", address: "2167 S Bayshore Dr", guestcount: 150, user_id: 1, confirmed: false},
  {name: "Added Full_calendar ", start_date: "2015-08-04 13:00:00", end_date: nil, zipcode: "33162", venue: "Home", state: "FL", city: "North Miami Beach", address: "1795 NE 175th St", guestcount: 1, user_id: 1, confirmed: false},
  {name: "Ironhack Presentation", start_date: "2015-08-06 15:00:00", end_date: nil, zipcode: "33131", venue: "Pipeline", state: "FL", city: "Miami", address: "1101 Brickell Avenue", guestcount: 60, user_id: 1, confirmed: false},
  {name: "Pool Party", start_date: "2015-08-19 16:00:00", end_date: nil, zipcode: "33162", venue: "Epic Hotel", state: "FL", city: "Miami", address: "Brickell", guestcount: 250, user_id: 1, confirmed: false}
])
Profile.create!([
  {user_id: 1, first_name: "Kaysser", owner: "Eddie Kayyali", city: "North Miami Beach", state: "FL", weburl: "www.macparking.co", last_name: "Kayyali", name: "Mac Parking inc.", email: "kaykayyali@macparking.co", phone: "3053181328", imageurl: "https://www.filepicker.io/api/file/r2vabUu1ShGhZOIeBAaG", rating: "5.0", description: "The greatest valet company on the face of the planet", message: "A place to park.", address: "1835 NE Miami Gardens Dr", zipcode: "33179", service_type: nil},
  {user_id: 2, first_name: "Gloria", owner: "Gloria Valencia", city: "North Miami Beach", state: "FL", weburl: "www.flowers.com", last_name: "Valencia", name: "Flower Power", email: "gvale014@fiu.edu", phone: "3053181328", imageurl: "http://a121.g.akamai.net/7/121/21164/20150227144413/flowercontent.net/fyf/images/products/large/T46-1.jpg", rating: "5.0", description: nil, message: "Flowers!", address: "1835 NE Miami Gardens Dr", zipcode: "33179", service_type: "4"},
  {user_id: 3, first_name: "Nizar", owner: "Ariel Quinones", city: "Brickell", state: "FL", weburl: "www.ironhack.com", last_name: "Khalife", name: "Ironhack", email: "nizar@ironhack.com", phone: "3053181328", imageurl: "https://upload.wikimedia.org/wikipedia/en/b/b0/Duneposter.jpg", rating: "5.0", description: nil, message: "Lets just watch dune.", address: "1101 Brickell Ave", zipcode: "33179", service_type: nil},
  {user_id: 4, first_name: "Josh", owner: "Josh Alexy", city: "Brickell", state: "FL", weburl: "www.sandwich.sexy", last_name: "Alexy", name: "Sandwich.sexy", email: "josh@ironhack.com", phone: "3053181328", imageurl: "http://www.runningwithtweezers.com/wp-content/uploads/2011/06/Sandwich311.jpg", rating: "5.0", description: nil, message: "Sandwiches!", address: "1101 Brickell Ave", zipcode: "33179", service_type: "6"}
])
Service.create!([
  {name: "Lighting"},
  {name: "Valet"},
  {name: "Sound Staging"},
  {name: "Floral Design"},
  {name: "Catering"},
  {name: "Furniture Rentals"},
  {name: "Web Design"}
])
