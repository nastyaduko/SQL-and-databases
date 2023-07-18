CREATE DATABASE homework_3;

USE homework_3;

CREATE TABLE salespeople
(
	snum INT NOT NULL PRIMARY KEY,
    sname VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL
);

CREATE TABLE customers
(
	cnum INT NOT NULL PRIMARY KEY,
    cname VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    rating INT NOT NULL,
    snum INT NOT NULL,
    FOREIGN KEY (snum) REFERENCES salespeople (snum)
);

CREATE TABLE orders
(
	onum INT NOT NULL PRIMARY KEY,
    amt FLOAT NOT NULL,
    odate DATE NOT NULL,
    cnum INT NOT NULL,
    snum INT NOT NULL,
    FOREIGN KEY (snum) REFERENCES salespeople (snum),
    FOREIGN KEY (cnum) REFERENCES customers (cnum)
);

INSERT INTO salespeople (snum, sname, city)
VALUES (1001, 'Peel', 'London'),
	(1002, 'Serres', 'San Jose'),
    (1004, 'Motika', 'London'),
    (1007, 'Rifkin', 'Barcelona'),
    (1003, 'Axelrod', 'New York');
    
INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES (2001, 'Hoffman', 'London', 100, 1001),
	(2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'San Jose', 200, 1002),
    (2004, 'Grass', 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
    (2008, 'Cisneros', 'San Jose', 300, 1007),
    (2007, 'Pereira', 'Rome', 100, 1004);

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES (3001, 18.69, '2016-01-01', 2008, 1007),
	(3003, 767.19, '2016-01-01', 2001, 1001),
    (3002, 1900.10, '2016-01-01', 2007, 1004),
    (3005, 5160.45, '2016-01-01', 2003, 1002),
    (3006, 1098.16, '2016-01-01', 2008, 1007),
    (3009, 1713.23, '2016-02-01', 2002, 1003),
    (3007, 75.75, '2016-02-01', 2004, 1002),
    (3008, 4723, '2016-03-01', 2006, 1001),
    (3010, 1309.95, '2016-04-01', 2004, 1002),
    (3011, 9891.88, '2016-04-01', 2006, 1001);

-- 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT SUM(amt) FROM orders
WHERE odate = '2016-01-01';

-- 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT DISTINCT city, COUNT(*) AS city_count FROM customers
GROUP BY city;

-- 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT cnum, MIN(amt) AS min_order_amount FROM orders
GROUP BY cnum;

-- 4. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г.
SELECT * FROM customers
WHERE cname LIKE 'G%';

-- 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе
SELECT city, MAX(rating) FROM customers
GROUP BY city;
