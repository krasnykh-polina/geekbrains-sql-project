#В каких странах наибольшее количество подтвержденных бронированей?
SELECT country, COUNT(bookings.hotel_id) AS total
	FROM hotels 
	JOIN bookings
	ON hotels.id = bookings.hotel_id AND booking_status_id = 2
	GROUP BY country
	ORDER BY total DESC;
	
#Вывести названия отелей категории 5* в Нидерландах
SELECT name, country 
	FROM hotels
	JOIN hotels_categories
	ON hotels.category_id = hotels_categories.id AND hotels_categories.category = "5"
	WHERE hotels.country = "Netherlands";
	
#Вывести имя и фамилию 10 пользователей с наименьшим количеством отзывов
SELECT first_name, last_name, COUNT(DISTINCT feedback.user_id) AS total
	FROM users
	LEFT JOIN feedback ON users.id = feedback.user_id
	GROUP BY users.id
	ORDER BY total
	LIMIT 10;
	
#Вывести 10 городов, которые чаще всего посещают перуанцы
SELECT hotels.city
	FROM hotels
	JOIN bookings
	ON hotels.id = bookings.hotel_id AND booking_status_id = 2
	JOIN users
	ON users.id = bookings.user_id AND users.country = "Peru"
	LIMIT 10;

#Вывести названия отелей, которые бронируются пользователями старше 40 лет, с указанием стран и городов
SELECT hotels.country, hotels.city, name FROM users
	JOIN bookings ON bookings.user_id = users.id
	JOIN hotels ON bookings.hotel_id = hotels.id 
	WHERE FLOOR(DATEDIFF(NOW(),birthday)/365) > 40;

#Вывести сумму подтвержденных бронирований, осуществленных пользователями старше 40 лет
SELECT SUM(total_hotels_bookings) AS sum_total_hotels_bookings_for_oldest
	FROM (SELECT COUNT(bookings.hotel_id) AS total_hotels_bookings
	FROM users
	JOIN bookings ON bookings.user_id = users.id AND bookings.booking_status_id = 2
	JOIN hotels ON bookings.hotel_id = hotels.id 
	WHERE FLOOR(DATEDIFF(NOW(),birthday)/365) > 40
	GROUP BY bookings.hotel_id) AS hotels_bookings_for_oldest;
