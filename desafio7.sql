SELECT 
    a.artist_name AS artista,
    al.name_album AS album,
    COUNT(f.id_artist) AS seguidores
FROM
    SpotifyClone.artists AS a
        INNER JOIN
    SpotifyClone.albuns AS al ON a.id_artist = al.id_artist
        INNER JOIN
    SpotifyClone.follow AS f ON a.id_artist = f.id_artist
GROUP BY al.name_album , a.artist_name
ORDER BY seguidores DESC , artista , album;