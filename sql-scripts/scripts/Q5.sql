SELECT
    a.name AS artist_name,
    COUNT(aa.id) AS num_aliases,
    STRING_AGG(DISTINCT aa.name, ', ' ORDER BY aa.name) AS comma_separated_list_of_aliases
FROM artist a
         JOIN artist_alias aa ON a.id = aa.artist
WHERE
    a.name LIKE '%John'
  AND LOWER(aa.name) NOT LIKE '%john%'
GROUP BY
    a.name
HAVING
    COUNT(aa.id) > 0
ORDER BY
    a.name;