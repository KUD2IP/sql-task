SELECT
   r.name AS RELEASE_NAME,
   ac.name AS ARTIST_NAME,
   ri.date_year AS RELEASE_YEAR

FROM
    release r
        JOIN artist_credit ac ON r.artist_credit = ac.id
        JOIN medium m ON r.id = m.release
        JOIN medium_format mf ON m.format = mf.id
        JOIN release_info ri on ri.release = r.id
        JOIN area ar ON ri.area = ar.id

WHERE
    mf.name = 'Cassette'

ORDER BY
    ri.date_year DESC NULLS LAST,
    ri.date_month DESC NULLS LAST,
    ri.date_day DESC NULLS LAST,
    r.name,
    ac.name
LIMIT 10;