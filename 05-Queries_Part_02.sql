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