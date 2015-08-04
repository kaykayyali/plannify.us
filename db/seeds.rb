User.create!([
  {role: "organizer", email: "kaykayyali@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2015-08-04 03:58:43", last_sign_in_at: "2015-08-04 03:25:30", current_sign_in_ip: "::1", last_sign_in_ip: "127.0.0.1", first_name: "Kaysser", last_name: "Kayyali"},
  {role: "vendor", email: "gvale014@fiu.edu", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-08-04 04:06:46", last_sign_in_at: "2015-08-04 03:28:33", current_sign_in_ip: "::1", last_sign_in_ip: "127.0.0.1", first_name: "Gloria", last_name: "Valencia"}
])
AssociatedService.create!([
  {service_id: 4, user_id: 2}
])
ConfirmedService.create!([
  {event_id: 1, associated_service_id: 1}
])
Event.create!([
  {name: "Kaysser's Bday Bash", start_date: "2015-11-13 20:00:00", end_date: "2015-11-14 02:00:00", zipcode: "33162", venue: "Home", state: "FL", city: "Miami", address: "1795 NE 175th st", guestcount: 50, user_id: 1}
])
Profile.create!([
  {user_id: 1, first_name: "Kaysser", owner: "Eddie Kayyali", city: "North Miami Beach", state: "FL", weburl: "www.macparking.co", last_name: "Kayyali", name: "Mac Parking inc.", email: "kaykayyali@macparking.co", phone: "3053181328", imageurl: "https://www.filepicker.io/api/file/r2vabUu1ShGhZOIeBAaG", rating: "5.0", description: "The greatest valet company on the face of the planet", message: "A place to park.", address: "1835 NE Miami Gardens Dr", zipcode: "33179", service_type: nil},
  {user_id: 2, first_name: "Gloria", owner: "Gloria Valencia", city: "North Miami Beach", state: "FL", weburl: "www.flowers.com", last_name: "Valencia", name: "Flower Power", email: "gvale014@fiu.edu", phone: "3054670704", imageurl: "http://a121.g.akamai.net/7/121/21164/20150227144413/flowercontent.net/fyf/images/products/large/T46-1.jpg", rating: nil, description: nil, message: "Flowers!", address: "1835 NE Miami Gardens Dr", zipcode: "33179", service_type: "4"}
])
Service.create!([
  {name: "Lighting"},
  {name: "Valet"},
  {name: "Sound Staging"},
  {name: "Floral Design"},
  {name: "Catering"},
  {name: "Furniture Rentals"}
])
