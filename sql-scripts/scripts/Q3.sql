SELECT
    a.name AS ARTIST_NAME,
    ri.date_month AS RELEASE_MONTH,
    COUNT(r.*) AS NUM_RELEASES
FROM artist a
         JOIN release r ON a.id = r.artist_credit
         JOIN release_info ri ON r.id = ri.release
         JOIN artist_type at ON a.type = at.id
WHERE
    at.name = 'Person'
  AND a.name LIKE 'Elvis%'
  AND ri.date_month IS NOT NULL
GROUP BY
    a.name, ri.date_month

ORDER BY
    num_releases DESC,
    a.name,
    ri.date_month;