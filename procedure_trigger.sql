DROP PROCEDURE IF EXISTS get_users_count;
DELIMITER //
CREATE PROCEDURE get_users_count ()
BEGIN
    SELECT COUNT(*) FROM users;
END //
DELIMITER ;

CALL get_users();



DROP TRIGGER IF EXISTS CheckDate;
DELIMITER //
CREATE TRIGGER CheckDate BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
  IF DATEDIFF(NEW.arrival,NEW.departure)>=0 THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong dates!';
	END IF;
END//
DELIMITER ;

INSERT INTO bookings (id, user_id, hotel_id, arrival, departure, booking_status_id) VALUES
	(NULL,'15', '15','2015-12-12', '2010-12-12', '1');