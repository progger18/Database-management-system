CREATE TABLE general_tour_agency_data (
    -- Заказ
    order_id INT NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    order_status VARCHAR(30) NOT NULL,
    order_tourists_count INT NOT NULL,
    order_total_cost NUMERIC(10, 2) NOT NULL,

    -- Клиент
    client_id INT NOT NULL,
    client_last_name VARCHAR(50) NOT NULL,
    client_first_name VARCHAR(50) NOT NULL,
    client_username VARCHAR(50),
    client_phone VARCHAR(20) NOT NULL,
    client_email VARCHAR(100),
    client_passport VARCHAR(20) NOT NULL,
    client_international_passport VARCHAR(20),

    -- Менеджер
    employee_id INT NOT NULL,
    employee_full_name VARCHAR(150) NOT NULL,
    employee_position VARCHAR(50),
    employee_phone VARCHAR(20),

    -- Тур
    tour_id INT NOT NULL,
    tour_title VARCHAR(150) NOT NULL,
    tour_country VARCHAR(100) NOT NULL,
    tour_city VARCHAR(100) NOT NULL,
    tour_hotel_name VARCHAR(100) NOT NULL,
    tour_nutrition_type VARCHAR(10),
    tour_start_date DATE NOT NULL,
    tour_duration_nights INT NOT NULL,
    tour_price_person NUMERIC(10, 2) NOT NULL,

    -- Турист
    tourist_id INT NOT NULL,
    tourist_last_name VARCHAR(50) NOT NULL,
    tourist_first_name VARCHAR(50) NOT NULL,
    tourist_username VARCHAR(20),
    tourist_birth_date DATE NOT NULL,
    tourist_international_passport VARCHAR(50) NOT NULL,

    -- Платеж
    payment_id INT,
    payment_date TIMESTAMP,
    payment_amount NUMERIC(10, 2),
    payment_method VARCHAR(20),

    CONSTRAINT check_positive_prices CHECK (order_total_cost >= 0 AND tour_price_person > 0),
    CONSTRAINT check_payment_amount CHECK (payment_amount IS NULL OR payment_amount > 0),
    CONSTRAINT check_duration CHECK (tour_duration_nights > 0)
);

ALTER TABLE general_tour_agency_data ADD COLUMN dt_date DATE;

ALTER TABLE general_tour_agency_data DROP COLUMN IF EXISTS dt_date;

INSERT INTO general_tour_agency_data (
    order_id, order_date, order_status, order_tourists_count, order_total_cost,
    client_id, client_last_name, client_first_name, client_username, client_phone, client_email, client_passport, client_international_passport,
    employee_id, employee_full_name, employee_position, employee_phone,
    tour_id, tour_title, tour_country, tour_city, tour_hotel_name, tour_nutrition_type, tour_start_date, tour_duration_nights, tour_price_person,
    tourist_id, tourist_last_name, tourist_first_name, tourist_username, tourist_birth_date, tourist_international_passport,
    payment_id, payment_date, payment_amount, payment_method
) VALUES 
(
    101, '2026-05-10 11:00:00', 'Оплачен', 1, 85000.00,
    1, 'Иванов', 'Иван', 'ivan_client', '+79991112233', 'ivanov@email.com', '4510 123456', '75 1234567',
    10, 'Петрова Анна Сергеевна', 'Старший менеджер', '101',
    50, 'Выходные в Стамбуле', 'Турция', 'Стамбул', 'Grand Hotel 4*', 'BB', '2026-06-15', 3, 85000.00,
    1, 'Иванов', 'Иван', 'ivan_tourist', '1990-05-15', '75 1234567',
    501, '2026-05-10 11:15:00', 85000.00, 'Наличные'
),
(
    102, '2026-05-12 14:30:00', 'Ждет подтверждения', 2, 240000.00,
    2, 'Смирнова', 'Елена', 'elena_travel', '+79992223344', 'smirnova@email.com', '4612 654321', '76 7654321',
    11, 'Васнецов Игорь Владимирович', 'Менеджер', '102',
    51, 'Райский Пхукет', 'Таиланд', 'Пхукет', 'Peach Resort 5*', 'AI', '2026-11-01', 10, 120000.00,
    2, 'Смирнова', 'Елена', 'elena_tourist', '1988-10-20', '76 7654321',
    502, '2026-05-12 14:45:00', 100000.00, 'Карта'
),
(
    102, '2026-05-12 14:30:00', 'Ждет подтверждения', 2, 240000.00,
    2, 'Смирнова', 'Елена', 'elena_travel', '+79992223344', 'smirnova@email.com', '4612 654321', '76 7654321',
    11, 'Васнецов Игорь Владимирович', 'Менеджер', '102',
    51, 'Райский Пхукет', 'Таиланд', 'Пхукет', 'Peach Resort 5*', 'AI', '2026-11-01', 10, 120000.00,
    3, 'Смирнов', 'Алексей', 'alex_tourist', '1985-03-12', '76 9876543',
    503, '2026-05-15 10:00:00', 140000.00, 'Карта'
),
(
    103, '2026-05-18 16:20:00', 'Новый', 1, 95000.00,
    3, 'Сидоров', 'Петр', 'sidor_p', '+79993334455', 'sidorov@email.com', '4515 987654', NULL,
    10, 'Петрова Анна Сергеевна', 'Старший менеджер', '101',
    52, 'Каникулы в Дубае', 'ОАЭ', 'Дубай', 'City Max 3*', 'HB', '2026-09-20', 7, 95000.00,
    4, 'Сидоров', 'Петр', 'sidor_tourist', '1995-07-07', '75 4567890',
    NULL, NULL, NULL, NULL
),
(
    104, '2026-05-20 09:15:00', 'Оплачен', 1, 60000.00,
    3, 'Сидоров', 'Петр', 'sidor_p', '+79993334455', 'sidorov@email.com', '4515 987654', NULL,
    11, 'Васнецов Игорь Владимирович', 'Менеджер', '102',
    53, 'Детский отдых в Сочи', 'Россия', 'Сочи', 'Сочи Парк Отель 3*', 'FB', '2026-06-01', 5, 60000.00,
    5, 'Сидорова', 'Мария', 'masha_tourist', '2015-12-12', '75 0001112',
    504, '2026-05-20 09:30:00', 60000.00, 'СБП'
);

SELECT * FROM general_tour_agency_data;

UPDATE general_tour_agency_data 
SET order_status = order_status || ', нечет проверка' 
WHERE order_id % 2 != 0;

SELECT * FROM general_tour_agency_data;

DELETE FROM general_tour_agency_data 
WHERE order_id = (SELECT MAX(order_id) FROM general_tour_agency_data);

SELECT * FROM general_tour_agency_data;
