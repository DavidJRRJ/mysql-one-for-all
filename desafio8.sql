SELECT 
    a.artist_name as artista, al.name_album as album
FROM
    SpotifyClone.artists AS a
        INNER JOIN
    SpotifyClone.albuns AS al ON al.id_artist = a.id_artist
WHERE
    a.artist_name LIKE 'Elis Regina'