SELECT 
    u.name AS usuario,
    COUNT(h.id_user) AS qt_de_musicas_ouvidas,
    ROUND(SUM(m.duration) / 60, 2) AS total_minutos
FROM
    SpotifyClone.users AS u
        INNER JOIN
    SpotifyClone.historic AS h ON u.id_user = h.id_user
        INNER JOIN
    SpotifyClone.musics AS m ON m.id_music = h.id_music
GROUP BY u.name
ORDER BY u.name;