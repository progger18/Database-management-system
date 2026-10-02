-- 1. Создаем и заполняем таблицу client
-- DROP TABLE IF EXISTS client CASCADE;

-- CREATE TABLE client (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(20) NOT NULL,
--     birthdate DATE,
--     address VARCHAR(100)
-- );

-- INSERT INTO client (name, birthdate, address)
-- VALUES
-- ('Anton', '2000-01-15', 'Москва, ул. Ленина, 1'),
-- ('Ivan', '1999-02-20', 'Москва, ул. Пушкина, 2'),
-- ('Petr', '2001-03-10', 'Москва, ул. Гагарина, 3'),
-- ('Anna', '2000-04-05', 'Москва, ул. Чехова, 4'),
-- ('Maria', '1998-05-18', 'Москва, ул. Мира, 5'),
-- ('Dmitry', '2002-06-22', 'Москва, ул. Советская, 6'),
-- ('Olga', '1997-07-11', 'Москва, ул. Центральная, 7'),
-- ('Alex', '2001-08-19', 'Москва, ул. Новая, 8'),
-- ('Sergey', '1999-09-09', 'Москва, ул. Школьная, 9'),
-- ('Anton', '2000-10-30', 'Москва, ул. Парковая, 10');

-- 2. Создаем и заполняем таблицу item
-- DROP TABLE IF EXISTS item CASCADE;

-- CREATE TABLE item (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(20) NOT NULL,
--     description VARCHAR(200)
-- );

-- INSERT INTO item (name, description)
-- VALUES
-- ('Турция', 'Тур в Анталью'),
-- ('Египет', 'Тур в Хургаду'),
-- ('ОАЭ', 'Тур в Дубай'),
-- ('Италия', 'Тур в Рим'),
-- ('Таиланд', 'Тур на Пхукет'),
-- ('Испания', 'Тур в Барселону'),
-- ('Франция', 'Тур в Париж'),
-- ('Греция', 'Тур на Крит'),
-- ('Кипр', 'Отдых на Кипре'),
-- ('Россия', 'Путешествие по России');

-- 3. Операция объединения id<5 и Anton
-- SELECT id, name
-- FROM client
-- WHERE id < 5

-- UNION

-- SELECT id, name
-- FROM client
-- WHERE name = 'Anton';

-- Подпункт: UNION ALL

-- SELECT id, name
-- FROM client
-- WHERE id < 5

-- UNION ALL

-- SELECT id, name
-- FROM client
-- WHERE name = 'Anton';

-- Подпункт: INTERSECT

-- SELECT id, name
-- FROM client
-- WHERE id < 8

-- INTERSECT

-- SELECT id, name
-- FROM client
-- WHERE name = 'Anton';

-- Подпункт: EXCEPT

-- SELECT id, name
-- FROM client
-- WHERE id < 8

-- EXCEPT

-- SELECT id, name
-- FROM client
-- WHERE name = 'Anton';

-- Подпункт: CROSS JOIN

-- SELECT
--     c.name AS client_name,
--     i.name AS item_name
-- FROM client c
-- CROSS JOIN item i;

-- Подпункт: DISTINCT
-- SELECT DISTINCT name
-- FROM client;

-- Проверка преобразования строк
-- SELECT COUNT(*) AS client_count
-- FROM client;

-- SELECT COUNT(*) AS item_count
-- FROM item;



-- SELECT * FROM client;