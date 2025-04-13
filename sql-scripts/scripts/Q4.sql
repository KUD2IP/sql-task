SELECT
    CONCAT((FLOOR(a.begin_date_year / 10) * 10), 's') AS decade,
    COUNT(a.*) AS num_artist_group
FROM artist a
         JOIN area ar ON a.area = ar.id
         JOIN artist_type at ON a.type = at.id
WHERE
    at.name = 'Group'
  AND ar.name = 'United States'
  AND a.begin_date_year IS NOT NULL
  AND a.begin_date_year BETWEEN 1900 AND 2023
GROUP BY
    FLOOR(a.begin_date_year / 10)
ORDER BY
    FLOOR(a.begin_date_year / 10);