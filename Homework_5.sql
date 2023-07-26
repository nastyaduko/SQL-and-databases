CREATE DATABASE homework_5;
USE homework_5;

CREATE TABLE cars 
(
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20),
    Cost INT
);

INSERT INTO cars (Name, Cost) VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

CREATE TABLE Gr 
(
	gr_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    gr_name VARCHAR(100) NOT NULL,
    gr_temp VARCHAR(30) NOT NULL
);

CREATE TABLE Analysis
(
	an_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    an_name VARCHAR(100) NOT NULL,
    an_cost DECIMAL NOT NULL,
    an_price DECIMAL NOT NULL,
    an_group INT NOT NULL,
    FOREIGN KEY (an_group) REFERENCES Gr (gr_id)
);

CREATE TABLE Orders
(
	ord_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ord_datetime DATE NOT NULL,
    ord_an INT NOT NULL,
    FOREIGN KEY (ord_an) REFERENCES Analysis (an_id)
);

INSERT INTO Gr (gr_name, gr_temp) VALUES
('First', '+5'),
('Second', '+10'),
('Third', '-2');

INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES
('Clinical blood', 10, 20, 1),
('Biohimical blood', 20, 35, 2),
('Vitamin D blood', 50, 70, 3),
('ESR blood', 5, 10, 1);

INSERT INTO Orders (ord_datetime, ord_an) VALUES
('2020-02-05', 1),
('2020-02-06', 2),
('2020-02-07', 3),
('2020-02-08', 4),
('2020-02-09', 1),
('2020-02-10', 2),
('2020-02-11', 3),
('2020-02-12', 4),
('2020-02-13', 1),
('2020-02-14', 2),
('2020-02-15', 3),
('2020-02-16', 4);

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE VIEW CheapCars AS 
SELECT Name FROM Cars WHERE Cost < 25000;

SELECT * FROM CheapCars;


-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW CheapCars AS
SELECT Name FROM Cars WHERE Cost < 30000;

SELECT * FROM CheapCars;


-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” 

CREATE VIEW Skoda_Audi AS
SELECT Name, Cost FROM cars 
WHERE Name = 'Skoda' OR Name = 'Audi';

SELECT * FROM Skoda_Audi;


-- 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 
-- Есть таблица анализов Analysis: an_id — ID анализа; an_name — название анализа; an_cost — себестоимость анализа; an_price — розничная цена анализа; an_group — группа анализов. 
-- Есть таблица групп анализов Groups: gr_id — ID группы; gr_name — название группы; gr_temp — температурный режим хранения. 
-- Есть таблица заказов Orders: ord_id — ID заказа; ord_datetime — дата и время заказа; ord_an — ID анализа.

CREATE VIEW my_analysis AS
SELECT an_name, an_price
FROM Orders AS o
LEFT JOIN Analysis as a
ON o.ord_an = a.an_id
WHERE ord_datetime >= '2020-02-05' AND ord_datetime < '2020-02-11';

SELECT an_name, MAX(an_price) AS Price
FROM my_analysis
GROUP BY an_name;
