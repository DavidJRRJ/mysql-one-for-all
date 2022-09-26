SELECT
	m.music_name AS nome,
  COUNT(h.id_music) AS reproducoes
FROM
	SpotifyClone.users AS u
INNER JOIN
	SpotifyClone.plans AS p ON u.plan_id = p.plan_id
INNER JOIN
	SpotifyClone.historic AS h ON h.id_user = u.id_user
INNER JOIN
	SpotifyClone.musics AS m ON m.id_music = h.id_music
WHERE p.name_plan IN ('gratuito', 'pessoal')
GROUP BY m.music_name
ORDER BY nome;