-- 1. Создание базы данных
-- DROP DATABASE IF EXISTS tourist_agency

-- CREATE DATABASE tourist_agency;

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

-- 2.
-- ALTER TABLE lab1_common
-- ADD COLUMN dt_date DATE;

-- 3.
-- SELECT column_name, data_type
-- FROM information_schema.columns
-- WHERE table_name = 'lab1_common'
-- ORDER BY ordinal_position;

-- 4.
-- ALTER TABLE lab1_common
-- DROP COLUMN dt_date;

