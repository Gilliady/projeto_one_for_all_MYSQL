SELECT 
	CASE 
		WHEN usuario_idade <= 30 THEN ('Até 30 anos')
        WHEN usuario_idade BETWEEN 31 AND 60 THEN ('Entre 31 e 60 anos')
        ELSE ('Maior de 60 anos')
	END as faixa_etaria,
		COUNT(DISTINCT usuario_id) as total_pessoas_usuarias,
        COUNT(mf.musica_id) as total_favoritadas
	FROM usuarios AS u
	LEFT JOIN musicas_favoritadas AS mf USING (usuario_id)
		GROUP BY   faixa_etaria
        ORDER BY faixa_etaria;