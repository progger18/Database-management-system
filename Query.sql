-- 1. Создание базы данных
-- DROP DATABASE IF EXISTS tourist_agency
-- CREATE DATABASE tourist_agency;

-- 2. Выстриваем структуру таблицы
-- CREATE TABLE lab1_common (
--     client_id INT,
--     client_last_name VARCHAR(50),
--     client_first_name VARCHAR(50),
--     client_username VARCHAR(50),
--     client_phone VARCHAR(20),
--     client_email VARCHAR(100),
--     client_passport VARCHAR(20),
--     client_international_passport VARCHAR(20),

--     employee_id INT,
--     employee_full_name VARCHAR(150),
--     employee_position VARCHAR(50),
--     employee_phone VARCHAR(20),

--     tour_id INT,
--     tour_title VARCHAR(150),
--     tour_country VARCHAR(100),
--     tour_city VARCHAR(100),
--     tour_hotel_name VARCHAR(100),
--     tour_nutrition_type VARCHAR(10),
--     tour_start_date DATE,
--     tour_duration_nights INT,
--     tour_price_person NUMERIC(10,2),

--     order_id INT,
--     order_date TIMESTAMP,
--     tourists_count INT,
--     total_cost NUMERIC(10,2),
--     order_status VARCHAR(30),

--     tourist_id INT,
--     tourist_last_name VARCHAR(50),
--     tourist_first_name VARCHAR(50),
--     tourist_username VARCHAR(20),
--     tourist_birth_date DATE,
--     tourist_international_passport VARCHAR(50),

--     payment_id INT,
--     payment_date TIMESTAMP,
--     payment_amount NUMERIC(10,2),
--     payment_method VARCHAR(20)
-- );

-- Проверка.
-- SELECT *
-- FROM lab1_common

-- 3. Добавляем столбец
-- ALTER TABLE lab1_common
-- ADD COLUMN dt_date DATE;

-- Проверка.
-- SELECT column_name, data_type
-- FROM information_schema.columns
-- WHERE table_name = 'lab1_common'
-- ORDER BY ordinal_position;

-- 4. Удаляем столбец dt_date
-- ALTER TABLE lab1_common
-- DROP COLUMN dt_date;

-- SELECT column_name, data_type
-- FROM information_schema.columns
-- WHERE table_name = 'lab1_common'
-- ORDER BY ordinal_position;


-- 5. Добавляем 5 записей
-- INSERT INTO lab1_common (
--     client_id,
--     client_last_name,
--     client_first_name,
--     client_username,
--     client_phone,
--     client_email,
--     client_passport,
--     client_international_passport,

--     employee_id,
--     employee_full_name,
--     employee_position,
--     employee_phone,

--     tour_id,
--     tour_title,
--     tour_country,
--     tour_city,
--     tour_hotel_name,
--     tour_nutrition_type,
--     tour_start_date,
--     tour_duration_nights,
--     tour_price_person,

--     order_id,
--     order_date,
--     tourists_count,
--     total_cost,
--     order_status,

--     tourist_id,
--     tourist_last_name,
--     tourist_first_name,
--     tourist_username,
--     tourist_birth_date,
--     tourist_international_passport,

--     payment_id,
--     payment_date,
--     payment_amount,
--     payment_method
-- )
-- VALUES
-- (
--     1,
--     'Иванов',
--     'Иван',
--     'ivanov01',
--     '89001111111',
--     'ivanov@mail.ru',
--     '4500 111111',
--     '7210 111111',

--     1,
--     'Петров Петр Сергеевич',
--     'Менеджер',
--     '89002222222',

--     1,
--     'Отдых в Турции',
--     'Турция',
--     'Анталья',
--     'Sun Hotel',
--     'ALL',
--     '2026-06-10',
--     7,
--     85000.00,

--     1,
--     '2026-05-01 10:00:00',
--     2,
--     170000.00,
--     'Оплачен',

--     1,
--     'Иванов',
--     'Иван',
--     'ivan_travel',
--     '2000-05-10',
--     '7210 111111',

--     1,
--     '2026-05-02 12:00:00',
--     170000.00,
--     'Карта'
-- ),
-- (
--     2,
--     'Смирнова',
--     'Анна',
--     'anna_sm',
--     '89003333333',
--     'smirnova@mail.ru',
--     '4500 222222',
--     '7210 222222',

--     2,
--     'Сидоров Алексей Иванович',
--     'Старший менеджер',
--     '89004444444',

--     2,
--     'Отдых в Египте',
--     'Египет',
--     'Хургада',
--     'Red Sea Hotel',
--     'ALL',
--     '2026-07-15',
--     10,
--     95000.00,

--     2,
--     '2026-05-03 11:30:00',
--     1,
--     95000.00,
--     'Новый',

--     2,
--     'Смирнова',
--     'Анна',
--     'anna_travel',
--     '1999-08-20',
--     '7210 222222',

--     2,
--     '2026-05-03 12:00:00',
--     95000.00,
--     'Карта'
-- ),
-- (
--     3,
--     'Кузнецов',
--     'Дмитрий',
--     'dima_k',
--     '89005555555',
--     'kuznetsov@mail.ru',
--     '4500 333333',
--     '7210 333333',

--     3,
--     'Орлов Михаил Петрович',
--     'Менеджер',
--     '89006666666',

--     3,
--     'Путешествие в ОАЭ',
--     'ОАЭ',
--     'Дубай',
--     'Dubai Beach',
--     'BB',
--     '2026-08-01',
--     6,
--     120000.00,

--     3,
--     '2026-05-05 14:00:00',
--     3,
--     360000.00,
--     'Оплачен',

--     3,
--     'Кузнецов',
--     'Дмитрий',
--     'dmitry_travel',
--     '1998-03-15',
--     '7210 333333',

--     3,
--     '2026-05-06 15:00:00',
--     360000.00,
--     'Перевод'
-- ),
-- (
--     4,
--     'Попова',
--     'Мария',
--     'masha_p',
--     '89007777777',
--     'popova@mail.ru',
--     '4500 444444',
--     '7210 444444',

--     1,
--     'Петров Петр Сергеевич',
--     'Менеджер',
--     '89002222222',

--     4,
--     'Отдых в Италии',
--     'Италия',
--     'Рим',
--     'Roma Hotel',
--     'BB',
--     '2026-09-05',
--     5,
--     110000.00,

--     4,
--     '2026-05-10 09:00:00',
--     2,
--     220000.00,
--     'Новый',

--     4,
--     'Попова',
--     'Мария',
--     'maria_travel',
--     '2001-01-25',
--     '7210 444444',

--     4,
--     '2026-05-10 10:00:00',
--     220000.00,
--     'Наличные'
-- ),
-- (
--     5,
--     'Волков',
--     'Александр',
--     'volkov_a',
--     '89009999999',
--     'volkov@mail.ru',
--     '4500 555555',
--     '7210 555555',

--     2,
--     'Сидоров Алексей Иванович',
--     'Старший менеджер',
--     '89004444444',

--     5,
--     'Отдых в Таиланде',
--     'Таиланд',
--     'Пхукет',
--     'Phuket Resort',
--     'BB',
--     '2026-10-10',
--     12,
--     130000.00,

--     5,
--     '2026-05-15 16:00:00',
--     4,
--     520000.00,
--     'Подтвержден',

--     5,
--     'Волков',
--     'Александр',
--     'alex_travel',
--     '1997-11-12',
--     '7210 555555',

--     5,
--     '2026-05-16 10:00:00',
--     520000.00,
--     'Карта'
-- );

-- SELECT * FROM lab1_common;

-- 7. Апдейт нечетных записей
-- UPDATE lab1_common
-- SET order_status = 'Обновлен'
-- WHERE client_id % 2 = 1;

-- SELECT * FROM lab1_common ORDER BY client_id;

-- 8. DELETE последней записи
-- DELETE FROM lab1_common
-- WHERE client_id = (
--     SELECT MAX(client_id)
--     FROM lab1_common
-- );

-- SELECT * FROM lab1_common ORDER BY client_id

-- 9. Лабораторная работа 1. Часть 2