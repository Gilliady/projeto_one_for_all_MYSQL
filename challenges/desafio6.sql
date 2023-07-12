SELECT 
	MIN(plano_preco) AS faturamento_minimo,
    MAX(plano_preco) AS faturamento_maximo,
    ROUND(AVG(plano_preco), 2) AS faturamento_medio,
    SUM(plano_preco) as faturamento_total
    FROM plano AS p
    INNER JOIN usuarios as u ON u.plano_id = p.plano_id;