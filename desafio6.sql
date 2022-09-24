SELECT 
    MIN(p.price_plan) AS 'faturamento_minimo',
    MAX(p.price_plan) AS 'faturamento_maximo',
    ROUND(avg(p.price_plan),2) as 'faturamento_medio',
    SUM(p.price_plan) as 'faturamento_total'
FROM
    SpotifyClone.plans AS p
    INNER JOIN
		SpotifyClone.users as u on u.plan_id = p.plan_id