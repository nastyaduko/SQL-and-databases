CREATE DATABASE homework_3_2;

USE homework_3_2;

CREATE TABLE emploies
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NULL,
surname VARCHAR(100) NULL,
speciality VARCHAR(100) NULL,
seniority INT NULL,
salary INT NULL,
age INT NULL
);

INSERT emploies(name, surname, speciality, seniority, salary, age)
VALUES ('Вася', 'Васькин', 'начальник', 40, 100000, 60),
	('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Маша', 'Машкина', 'начальник', 40, 100000, 50);

-- 1. Отсортируйте поле “сумма” в порядке убывания и возрастания    
SELECT * FROM emploies
ORDER BY salary;

SELECT * FROM emploies
ORDER BY salary DESC;

-- 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
SELECT * FROM emploies
ORDER BY salary
LIMIT 1, 5;

-- 3. Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000
SELECT speciality, COUNT(speciality) AS number_of_workers_with_salary_lower_20000 FROM emploies
GROUP BY speciality, salary
HAVING (speciality = 'рабочий') AND (salary > 20000);

