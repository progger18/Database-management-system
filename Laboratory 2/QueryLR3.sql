DROP SCHEMA IF EXISTS lr3 CASCADE;
CREATE SCHEMA lr3;

CREATE TABLE lr3.clients (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    username VARCHAR(50),
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    passport VARCHAR(20) NOT NULL,
    international_passport VARCHAR(20)
);

CREATE TABLE lr3.orders (
    id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    employee_id INT NOT NULL,
    tour_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tourists_count INT NOT NULL,
    total_cost NUMERIC(10,2) NOT NULL,
    status VARCHAR(30),
    CONSTRAINT fk_lr3_orders_client FOREIGN KEY (client_id) REFERENCES lr3.clients(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE lr3.payments (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    payment_method VARCHAR(20),
    CONSTRAINT fk_lr3_payments_order FOREIGN KEY (order_id) REFERENCES lr3.orders(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO lr3.clients (last_name, first_name, username, phone, email, passport, international_passport)
VALUES
('Иванов', 'Иван', 'ivanov01', '89110000001', 'lr3_ivanov@mail.ru', '4500 000001', '7210 000001'),
('Смирнова', 'Анна', 'anna_sm', '89110000002', 'lr3_smirnova@mail.ru', '4500 000002', '7210 000002'),
('Кузнецов', 'Дмитрий', 'dima_k', '89110000003', 'lr3_kuznetsov@mail.ru', '4500 000003', '7210 000003'),
('Попова', 'Мария', 'masha_p', '89110000004', 'lr3_popova@mail.ru', '4500 000004', '7210 000004'),
('Волков', 'Александр', 'volkov_a', '89110000005', 'lr3_volkov@mail.ru', '4500 000005', '7210 000005');

INSERT INTO lr3.orders (client_id, employee_id, tour_id, order_date, tourists_count, total_cost, status)
VALUES
(1, 1, 1, '2026-05-01 10:00:00', 2, 170000, 'Оплачен'),
(2, 2, 2, '2026-05-03 11:30:00', 1, 95000, 'Новый'),
(3, 3, 3, '2026-05-05 14:00:00', 3, 360000, 'Оплачен'),
(4, 1, 4, '2026-05-10 09:00:00', 2, 220000, 'Новый'),
(1, 2, 5, '2026-05-15 16:00:00', 4, 520000, 'Подтвержден');

INSERT INTO lr3.payments (order_id, payment_date, amount, payment_method)
VALUES
(1, '2026-05-02 12:00:00', 170000, 'Карта'),
(2, '2026-05-03 12:00:00', 95000, 'Карта'),
(3, '2026-05-06 15:00:00', 360000, 'Перевод'),
(4, '2026-05-10 10:00:00', 220000, 'Наличные'),
(5, '2026-05-16 10:00:00', 520000, 'Карта');

SELECT * FROM lr3.clients ORDER BY id;
SELECT * FROM lr3.orders ORDER BY id;
SELECT * FROM lr3.payments ORDER BY id;


SELECT
    c.id AS client_id,
    c.last_name,
    c.first_name,
    o.id AS order_id,
    o.order_date,
    o.total_cost,
    p.id AS payment_id,
    p.payment_date,
    p.amount,
    p.payment_method
FROM lr3.clients c
INNER JOIN lr3.orders o ON c.id = o.client_id
INNER JOIN lr3.payments p ON o.id = p.order_id
ORDER BY c.id, o.id, p.id;

SELECT
    c.id AS client_id,
    c.last_name,
    c.first_name,
    o.id AS order_id,
    o.total_cost
FROM lr3.clients c
LEFT OUTER JOIN lr3.orders o ON c.id = o.client_id
ORDER BY c.id, o.id;

SELECT
    c.id AS client_id,
    c.last_name,
    c.first_name,
    o.id AS order_id,
    o.total_cost
FROM lr3.orders o
RIGHT OUTER JOIN lr3.clients c ON o.client_id = c.id
ORDER BY c.id, o.id;

SELECT
    c.id AS client_id,
    c.last_name,
    c.first_name,
    o.id AS order_id,
    o.client_id AS order_client_id,
    o.total_cost
FROM lr3.clients c
FULL OUTER JOIN lr3.orders o ON c.id = o.client_id
ORDER BY c.id, o.id;

SELECT c.*
FROM lr3.clients c
WHERE c.id NOT IN (
    SELECT o.client_id
    FROM lr3.orders o
);

SELECT c.*
FROM lr3.clients c
WHERE EXISTS (
    SELECT 1
    FROM lr3.orders o
    WHERE o.client_id = c.id
);

DROP TABLE IF EXISTS tmp_clients;

CREATE TEMPORARY TABLE tmp_clients AS
SELECT *
FROM lr3.clients
WHERE id % 2 = 0;

INSERT INTO tmp_clients
SELECT *
FROM lr3.clients
WHERE id = 1;

SELECT * FROM tmp_clients ORDER BY id;

DROP TABLE IF EXISTS tmp2_clients;

CREATE TABLE tmp2_clients AS
SELECT *
FROM lr3.clients
WHERE id % 2 = 0;

INSERT INTO tmp2_clients
SELECT *
FROM lr3.clients
WHERE id = 1;

SELECT * FROM tmp2_clients ORDER BY id;

DROP TABLE IF EXISTS orders_section CASCADE;

CREATE TABLE orders_section (
    id INT,
    client_id INT,
    employee_id INT,
    tour_id INT,
    order_date TIMESTAMP,
    tourists_count INT,
    total_cost NUMERIC(10,2),
    status VARCHAR(30),
    log_date DATE
)
PARTITION BY RANGE (log_date);

CREATE TABLE orders_section_2026
PARTITION OF orders_section
FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

INSERT INTO orders_section
SELECT id, client_id, employee_id, tour_id, order_date, tourists_count, total_cost, status, order_date::date
FROM lr3.orders;

SELECT * FROM orders_section ORDER BY log_date, id;
SELECT * FROM orders_section_2026 ORDER BY log_date, id;

CREATE TABLE orders_section_2027
PARTITION OF orders_section
FOR VALUES FROM ('2027-01-01') TO ('2028-01-01');

SELECT
    id,
    last_name,
    first_name,
    ROW_NUMBER() OVER (ORDER BY last_name) AS row_number
FROM lr3.clients
ORDER BY last_name;

WITH numbered_clients AS (
    SELECT
        id,
        last_name,
        first_name,
        ROW_NUMBER() OVER (ORDER BY last_name) AS row_number
    FROM lr3.clients
)
SELECT *
FROM numbered_clients
ORDER BY row_number;

DROP TABLE IF EXISTS tmp_identity_clients;

CREATE TEMPORARY TABLE tmp_identity_clients (
    idd INT GENERATED ALWAYS AS IDENTITY,
    id INT,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    username VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    passport VARCHAR(20),
    international_passport VARCHAR(20)
);

INSERT INTO tmp_identity_clients (
    id,
    last_name,
    first_name,
    username,
    phone,
    email,
    passport,
    international_passport
)
SELECT
    id,
    last_name,
    first_name,
    username,
    phone,
    email,
    passport,
    international_passport
FROM lr3.clients;

SELECT * FROM tmp_identity_clients ORDER BY idd;

DELETE FROM tmp_identity_clients
WHERE idd = 1;

SELECT * FROM tmp_identity_clients ORDER BY idd;

INSERT INTO tmp_identity_clients (
    id,
    last_name,
    first_name,
    username,
    phone,
    email,
    passport,
    international_passport
)
VALUES (
    999,
    'Тестовый',
    'Клиент',
    'test_identity',
    '89998887766',
    'identity@mail.ru',
    '9999 999999',
    '9999 999999'
);

SELECT * FROM tmp_identity_clients ORDER BY idd;