SELECT
  b.title,
  b.author_name,
  p.name AS publisher
FROM
  books b
  CROSS JOIN publishers p;

ALTER TABLE publishers
ADD COLUMN publisher_id INT;

SELECT
  *
FROM
  books
  NATURAL JOIN publishers;

SELECT
  title,
  price,
  author_name
FROM
  books
WHERE
  price > (
    SELECT
      AVG(price)
    FROM
      books
  );

SELECT
  AVG(price)
FROM
  books;

ALTER TABLE publishers
DROP COLUMN publisher_id;

SELECT
  *
FROM
  publishers
WHERE
  id IN (
    SELECT
      publisher_id
    FROM
      books
    GROUP BY
      publisher_id
    HAVING
      COUNT(*) > 1
  );

SELECT
  *
FROM
  publishers p
WHERE
  EXISTS (
    SELECT
      *
    FROM
      books b
    WHERE
      b.publisher_id = p.id
      AND b.in_stock = TRUE
  );

SELECT
  *
FROM
  books
WHERE
  publisher_id IN (
    SELECT
      id
    FROM
      publishers
    WHERE
      name ILIKE '%penguin%'
  );

SELECT
  *
FROM
  books b
  JOIN publishers p ON b.publisher_id = p.id
WHERE
  name ILIKE '%penguin%';

SELECT
  *
FROM
  books;

CREATE VIEW
  available_books AS
SELECT
  *
FROM
  books
WHERE
  in_stock = TRUE;

SELECT
  *
FROM
  available_books;

DROP VIEW available_books;