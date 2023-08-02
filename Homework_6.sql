USE seminar_6;


-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION num_to_date(num INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
    DECLARE str VARCHAR(50);
    
    SET days = num DIV 86400 ;
    SET hours = num % 86400 DIV 3600;
    SET minutes = num % 86400 % 3600 DIV 60;
    SET seconds = num % 86400 % 3600 % 60;    
    
    SET str = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    RETURN str;
END $$
DELIMITER ;

SELECT num_to_date(123456);


-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DELIMITER $$
CREATE FUNCTION evens()
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE num INT DEFAULT 1;
    DECLARE str VARCHAR(30) DEFAULT ' ';
    
    WHILE num < 11 DO
		IF num % 2 = 0 THEN
			SET str = CONCAT(str, num);
		SET num = num + 1;
        END IF;
	END WHILE;
    
    RETURN str;
END $$
DELIMITER ;
    
SELECT evens();

