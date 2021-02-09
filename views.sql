CREATE VIEW feedbacks_of_users (first_name, last_name, hotel, country, city, feedback)
AS SELECT users.first_name, users.last_name, hotels.name, hotels.country, hotels.city, feedback.body
FROM users
JOIN feedback ON feedback.user_id = users.id
JOIN hotels ON feedback.hotel_id = hotels.id;

SELECT * FROM feedbacks_of_users;

CREATE VIEW users_reservation_info (first_name, last_name, hotel, arrival, departure, booking_status)
AS SELECT users.first_name, users.last_name, hotels.name, bookings.arrival, bookings.departure, booking_status.name 
FROM users
JOIN bookings ON bookings.user_id = users.id 
JOIN hotels ON bookings.hotel_id = hotels.id 
JOIN booking_status ON booking_status.id = bookings.booking_status_id;

SELECT * FROM users_reservation_info;