SELECT 
  COUNT(h.id_user) quantidade_musicas_no_historico
FROM
	SpotifyClone.historic AS h
INNER JOIN
	SpotifyClone.users AS u ON u.id_user = h.id_user
GROUP BY u.name
HAVING name = 'Barbara Liskov';