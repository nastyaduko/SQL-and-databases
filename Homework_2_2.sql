CREATE DATABASE IF NOT EXISTS excersise_2;

USE excersise_2;

CREATE TABLE orders
(
orderid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
employeeid VARCHAR(5),
amount FLOAT,
orderstatus VARCHAR(10)
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES 	('e03', 15.00, 'OPEN'),
		('e01', 25.50, 'OPEN'),
        ('e05', 100.70, 'CLOSED'),
        ('e02', 22.18, 'OPEN'),
        ('e04', 9.50, 'CANCELLED'),
        ('e04', 99.99, 'OPEN');

SELECT
	orderid,
    orderstatus,
	CASE
		WHEN orderstatus = 'OPEN' THEN 'Order is in open state.'
        WHEN orderstatus = 'CLOSED' THEN 'Order is closed.'
        WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled.'
	END order_summary
FROM orders;
		