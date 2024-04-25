SELECT * FROM tasks WHERE user_id=1ж

SELECT tasks.*
FROM tasks
JOIN status ON tasks.status_id = status.id
WHERE status.name = 'new';

UPDATE tasks
SET status_id = 2
WHERE id = 1;

SELECT *
FROM users
WHERE id NOT IN (
    SELECT DISTINCT user_id
    FROM tasks
    WHERE user_id IS NOT NULL
);

INSERT INTO tasks (title, description, status_id, user_id)
VALUES ('New Task ', 'Description of new task', 1, 7);

SELECT *
FROM tasks
WHERE status_id <> 3;

DELETE FROM tasks
WHERE id = 30;

SELECT *
FROM users
WHERE email LIKE 'bryan26@example.org';

UPDATE users
SET fullname = 'New fullname'
WHERE id = 7;

SELECT status.name, COUNT(tasks.id) AS task_count
FROM status
LEFT JOIN tasks ON status.id = tasks.status_id
GROUP BY status.name;

SELECT tasks.*
FROM tasks
JOIN users ON tasks.user_id = users.id
WHERE users.email LIKE '%@example.com';

SELECT *
FROM tasks
WHERE description IS NULL OR description = '';

SELECT users.*, tasks.*
FROM users
INNER JOIN tasks ON users.id = tasks.user_id
WHERE tasks.status_id = (
    SELECT id FROM status WHERE name = 'in progress'
);

SELECT users.id, users.fullname, COUNT(tasks.id) AS task_count
FROM users
LEFT JOIN tasks ON users.id = tasks.user_id
GROUP BY users.id, users.fullname;

