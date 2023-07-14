CREATE DATABASE IF NOT EXISTS exercise_1;

USE exercise_1;

CREATE TABLE sales
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
quantity INT
);

 INSERT sales (order_date, quantity)
 VALUES ('2023-07-01', 50),
		('2023-07-02', 100),
        ('2023-07-03', 150),
        ('2023-07-04', 200),
        ('2023-07-05', 250),
        ('2023-07-06', 300),
        ('2023-07-07', 350),
        ('2023-07-08', 450);
        
SELECT
	id,
    order_date,
    CASE 
		WHEN quantity <= 100 THEN 'less or equal to 100'
        WHEN quantity > 100 AND quantity <= 300 THEN '101 to 300'
        ELSE 'more than 300'
	END bucket
FROM sales;