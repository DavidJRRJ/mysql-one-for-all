SELECT 
    u.name AS usuario,
    IF(YEAR(MAX(h.reprodution_data)) >= 2021,
        'Usuário ativo',
        'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.users AS u
        INNER JOIN
    SpotifyClone.historic AS h ON u.id_user = h.id_user
group by u.name
ORDER BY u.name;