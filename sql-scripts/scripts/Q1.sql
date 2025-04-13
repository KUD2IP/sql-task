SELECT
    r.name AS RELEASE_NAME,
    MIN(ri.date_year) AS RELEASE_YEAR
FROM
    release r
        JOIN artist_credit ac ON r.artist_credit = ac.id
        JOIN medium m ON r.id = m.release
        JOIN medium_format mf ON m.format = mf.id
        JOIN release_info ri on ri.release = r.id
        JOIN area ar ON ri.area = ar.id

WHERE
    ac.name = 'The Beatles'
  AND mf.name = '12" Vinyl'
  AND ar.name = 'United Kingdom'
  AND ri.date_year < 1970
GROUP BY r.name
ORDER BY RELEASE_YEAR, RELEASE_NAME;
