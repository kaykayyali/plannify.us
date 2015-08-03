User.create!([
  {role: "organizer", email: "kaykayyali@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-08-03 15:19:59", last_sign_in_at: "2015-08-03 15:19:59", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Kaysser", last_name: "Kayyali"}
])
Event.create!([
  {name: "Kaysser's Bday Bash", start_date: "2015-11-13 20:00:00", end_date: "2015-11-14 02:00:00", zipcode: "33162", venue: "Home", state: "FL", city: "Miami", address: "1795 NE 175th st", guestcount: 50, user_id: 1}
])
Profile.create!([
  {user_id: 1, first_name: "Kaysser", owner: "Eddie Kayyali", city: "Miami", state: "Floria", weburl: "www.macparking.co", last_name: "Kayyali", name: "Mac Parking inc.", email: "kaykayyali@macparking.co", phone: "3053181328", imageurl: nil, rating: 5, description: "The greatest valet company on the face of the planet"}
])
