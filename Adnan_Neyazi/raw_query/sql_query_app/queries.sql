-- Select all users
SELECT * FROM users;

-- -- Select users with age greater than 30
SELECT * FROM users WHERE age > 30;

-- -- Delete users with age less than 25
DELETE FROM users WHERE age < 25;

-- -- Update age of users with name 'John' to 40
UPDATE users SET age = 60 WHERE name = 'Alice Johnsonnnn';

-- -- Select users and their corresponding orders
SELECT users.*, orders.*
FROM users
INNER JOIN orders ON users.id = orders.user_id;

-- -- Select users and their corresponding orders (equivalent to INNER JOIN)
SELECT users.*, orders.*
FROM users
JOIN orders ON users.id = orders.user_id;

-- -- -- Select users and their corresponding orders using LEFT OUTER JOIN
SELECT users.*, orders.*
FROM users
LEFT OUTER JOIN orders ON users.id = orders.user_id;
