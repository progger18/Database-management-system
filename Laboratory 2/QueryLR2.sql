DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS order_tourists CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS tourists CASCADE;
DROP TABLE IF EXISTS tours CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS clients CASCADE;

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    username VARCHAR(50),
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    passport VARCHAR(20) NOT NULL,
    international_passport VARCHAR(20)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    position VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE tours (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    hotel_name VARCHAR(100) NOT NULL,
    nutrition_type VARCHAR(10),
    start_date DATE NOT NULL,
    duration_nights INT NOT NULL,
    price_person NUMERIC(10,2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    employee_id INT NOT NULL,
    tour_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tourists_count INT NOT NULL,
    total_cost NUMERIC(10,2) NOT NULL,
    status VARCHAR(30),
    CONSTRAINT fk_orders_client FOREIGN KEY (client_id) REFERENCES clients(id),
    CONSTRAINT fk_orders_employee FOREIGN KEY (employee_id) REFERENCES employees(id),
    CONSTRAINT fk_orders_tour FOREIGN KEY (tour_id) REFERENCES tours(id)
);

CREATE TABLE tourists (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    username VARCHAR(20),
    birth_date DATE NOT NULL,
    international_passport VARCHAR(50) NOT NULL
);

CREATE TABLE order_tourists (
    order_id INT NOT NULL,
    tourists_id INT NOT NULL,
    PRIMARY KEY (order_id, tourists_id),
    CONSTRAINT fk_order_tourists_order FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_order_tourists_tourist FOREIGN KEY (tourists_id) REFERENCES tourists(id)
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    payment_method VARCHAR(20),
    CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES orders(id)
);

INSERT INTO clients
(last_name, first_name, username, phone, email, passport, international_passport)
VALUES
('Иванов', 'Иван', 'ivanov01', '89001111111', 'ivanov@mail.ru', '4500 111111', '7210 111111'),
('Смирнова', 'Анна', 'anna_sm', '89003333333', 'smirnova@mail.ru', '4500 222222', '7210 222222'),
('Кузнецов', 'Дмитрий', 'dima_k', '89005555555', 'kuznetsov@mail.ru', '4500 333333', '7210 333333'),
('Попова', 'Мария', 'masha_p', '89007777777', 'popova@mail.ru', '4500 444444', '7210 444444'),
('Волков', 'Александр', 'volkov_a', '89009999999', 'volkov@mail.ru', '4500 555555', '7210 555555');

INSERT INTO employees
(full_name, position, phone)
VALUES
('Петров Петр Сергеевич', 'Менеджер', '89002222222'),
('Сидоров Алексей Иванович', 'Старший менеджер', '89004444444'),
('Орлов Михаил Петрович', 'Менеджер', '89006666666'),
('Федорова Елена Андреевна', 'Менеджер', '89008888888'),
('Морозов Сергей Олегович', 'Директор', '89001010101');

INSERT INTO tours
(title, country, city, hotel_name, nutrition_type, start_date, duration_nights, price_person)
VALUES
('Отдых в Турции', 'Турция', 'Анталья', 'Sun Hotel', 'ALL', '2026-06-10', 7, 85000),
('Отдых в Египте', 'Египет', 'Хургада', 'Red Sea Hotel', 'ALL', '2026-07-15', 10, 95000),
('Путешествие в ОАЭ', 'ОАЭ', 'Дубай', 'Dubai Beach', 'BB', '2026-08-01', 6, 120000),
('Отдых в Италии', 'Италия', 'Рим', 'Roma Hotel', 'BB', '2026-09-05', 5, 110000),
('Отдых в Таиланде', 'Таиланд', 'Пхукет', 'Phuket Resort', 'BB', '2026-10-10', 12, 130000);

INSERT INTO orders
(client_id, employee_id, tour_id, order_date, tourists_count, total_cost, status)
VALUES
(1, 1, 1, '2026-05-01 10:00:00', 2, 170000, 'Оплачен'),
(2, 2, 2, '2026-05-03 11:30:00', 1, 95000, 'Новый'),
(3, 3, 3, '2026-05-05 14:00:00', 3, 360000, 'Оплачен'),
(4, 1, 4, '2026-05-10 09:00:00', 2, 220000, 'Новый'),
(1, 2, 5, '2026-05-15 16:00:00', 4, 520000, 'Подтвержден');

INSERT INTO tourists
(last_name, first_name, username, birth_date, international_passport)
VALUES
('Иванов', 'Иван', 'ivan_travel', '2000-05-10', '7210 111111'),
('Смирнова', 'Анна', 'anna_travel', '1999-08-20', '7210 222222'),
('Кузнецов', 'Дмитрий', 'dmitry_travel', '1998-03-15', '7210 333333'),
('Попова', 'Мария', 'maria_travel', '2001-01-25', '7210 444444'),
('Волков', 'Александр', 'alex_travel', '1997-11-12', '7210 555555');

INSERT INTO order_tourists (order_id, tourists_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

INSERT INTO payments (order_id, payment_date, amount, payment_method)
VALUES
(1, '2026-05-02 12:00:00', 170000, 'Карта'),
(2, '2026-05-03 12:00:00', 95000, 'Карта'),
(3, '2026-05-06 15:00:00', 360000, 'Перевод'),
(4, '2026-05-10 10:00:00', 220000, 'Наличные'),
(5, '2026-05-16 10:00:00', 520000, 'Карта');

SELECT * FROM clients;
SELECT * FROM employees;
SELECT * FROM tours;
SELECT * FROM orders;
SELECT * FROM tourists;
SELECT * FROM order_tourists;
SELECT * FROM payments;

ALTER TABLE employees ADD COLUMN comments VARCHAR(100);

UPDATE employees
SET comments = full_name || ', ' || COALESCE(position, '') || ', ' || COALESCE(phone, '');

SELECT * FROM employees;

ALTER TABLE employees DROP COLUMN comments;

SELECT * FROM employees;

DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS "group" CASCADE;

CREATE TABLE "group" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    fio VARCHAR(100) NOT NULL,
    id_g INT NOT NULL,
    CONSTRAINT fk_student_group
        FOREIGN KEY (id_g)
        REFERENCES "group"(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
);

INSERT INTO "group" (name)
VALUES
('А-08-24'),
('А-09-24'),
('А-10-24');

INSERT INTO student (fio, id_g)
VALUES
('Закиров Амир', 1),
('Иванов Иван', 1),
('Петров Петр', 1),
('Сидоров Алексей', 2),
('Смирнов Дмитрий', 2),
('Кузнецов Максим', 2),
('Орлов Михаил', 3),
('Попов Андрей', 3),
('Волков Сергей', 3);

SELECT * FROM "group" ORDER BY id;
SELECT * FROM student ORDER BY id;

SELECT s.id, s.fio, s.id_g, g.name
FROM student s
JOIN "group" g ON s.id_g = g.id
ORDER BY s.id;

DELETE FROM student
WHERE id = 1;

SELECT * FROM student ORDER BY id;
SELECT * FROM "group" ORDER BY id;

DELETE FROM "group"
WHERE id = 3;

SELECT * FROM student ORDER BY id;
SELECT * FROM "group" ORDER BY id;

UPDATE student
SET id_g = 1
WHERE id = 4;

SELECT * FROM student WHERE id = 4;
SELECT * FROM "group" ORDER BY id;

UPDATE "group"
SET id = 10
WHERE id = 1;

BEGIN;

DROP TABLE IF EXISTS student_final;
DROP TABLE IF EXISTS "group_final";

CREATE TABLE "group_final" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE student_final (
    id SERIAL PRIMARY KEY,
    fio VARCHAR(100) NOT NULL,
    id_g INT NOT NULL,
    CONSTRAINT fk_student_final_group
        FOREIGN KEY (id_g)
        REFERENCES "group_final"(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

ROLLBACK;