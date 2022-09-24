SELECT
  m.music_name as cancao,
  COUNT(h.reprodution_data) AS reproducoes
FROM
  SpotifyClone.musics AS m
  INNER JOIN SpotifyClone.historic AS h ON m.id_music = h.id_music
GROUP BY
  music_name
ORDER BY
  reproducoes DESC,
  cancao ASC
LIMIT
  2