-- Creating of a table in db.
CREATE TABLE users {
    id BIGINT NOT NULL PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    email VARCHAR(128) NOT NULL
};

CREATE TABLE spendings {
    id BIGINT NOT NULL PRIMARY KEY,
    price INT NOT NULL,
    created_at INT NOT NULL,
    user_id BIGINT NOT NULL,

    CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users (id)
};

CREATE TABLE categories {
    id BIGINT NOT NULL PRIMARY KEY,
    names VARCHAR(64) NOT NULL,
    importance VARCHAR(64) NOT NULL
};




-- Insertion of data in table 'users'
INSERT INTO users (id, first_name, last_name, email) 
VALUES (1, 'Artur', 'Statkevych', 'arturSt@gmail.com');

INSERT INTO users (id, first_name, last_name, email) 
VALUES (2, 'Denys', 'Borets', 'denis@gmail.com');

INSERT INTO users (id, first_name, last_name, email) 
VALUES (3, 'Oleg', 'Kopchik', 'olkopchik@gmail.com');


-- Updating of data in table 'users'
UPDATE users SET email = 'Denchik@gmail.com', first_name = 'Elon' 
WHERE id = 2;


-- Deleting of data from table 'users'
DELETE FROM users 
WHERE id = 2 OR id = 3;


-- Seleting of data from table 'users'
SELECT * FROM users;

SELECT id, first_name FROM users;

SELECT first_name, last_name, email FROM users
WHERE (id = 1 OR id = 2) AND first_name = 'Artur';




-- Joining of few tables in one table
SELECT spendings.*, users.first_name FROM spendings 
INNER JOIN users ON users.id = spendings.user_id;
-- INNER JOIN == JOIN

-- Види Join-ів:
-- 1)INNER JOIN(JOIN)
-- 2)LEFT OUTER JOIN
-- 3)RIGHT OUTER JOIN
-- 4)FULL OUTER JOIN
-- 5)CROSS JOIN - Об'єднання кожного users.id з кожним spendings.user_id




-- Агрегатні функції:
-- AVG - Середнє серед значень стовпця,
-- SUM - Сума всіх значень стовпця,
-- COUNT - Кількість значень в стовпці,
-- DISTINCT - Виключає рядки, що повторюються,
-- MAX - Максимальний елемент в стовпці,
-- MIN - Мінімальний елемент в стовпці,
-- UPPER - Переводить текст в верхній регістр,
-- LOWER - Переводить текст в нижній регістр,




-- GROUP BY
SELECT DISTINCT SUM(price) FROM spendings GROUP BY user_id;


-- ORDER BY:
-- ASC - Згруповані по 'ORDER BY' в прямому порядку
-- DESC - Згруповані по 'ORDER BY' в зворотньому порядку
-- LIMIT - Вивести тільки вказану кількість рядків таюлиці
SELECT SUM(price) FROM spendings ORDER BY user_id DESC LIMIT 3;


-- HAVING - Застосовується замість WHERE при роботі з агрегатними функціями 
--- Застосовується ТІЛЬКИ після GROUP BY
SELECT users.*, SUM(spendings.price) FROM users
JOIN spendings ON users.id =spendings.user_id
GROUP BY spendings.user_id
HAVING SUM(spendings.price);




-- Зміна таблиць без їх видалення
ALTER TABLE spendings ADD COLUMN category_id BIGINT;

ALTER TABLE spendings ADD CONSTRAINT category_id_fk
FOREIGN KEY (category_id) REFERENCES categories (id);

INSERT INTO spendings (id, price, user_id, category_id)
VALUES (4, 532, 2, 1);




-- Індексація
CREATE INDEX spendings_price ON spendings (price);

CREATE INDEX user_full_name ON users (first_name, ;last_name);