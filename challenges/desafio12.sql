SELECT 
	artista_nome as artista,
    CASE
		WHEN COUNT(mf.musica_id) >= 5 THEN ('A')
        WHEN COUNT(mf.musica_id) IN (3, 4) THEN ('B')
        WHEN COUNT(mf.musica_id)  IN (1, 2) THEN ('C')
		ELSE ('-')
		END ranking
    FROM musicas_favoritadas AS mf
    RIGHT JOIN musicas AS m USING (musica_id)
    INNER JOIN albuns AS al USING (album_id)
    INNER JOIN artistas AS a USING (artista_id)
    GROUP BY artista_nome
    ORDER BY COUNT(mf.musica_id) DESC, artista_nome ASC;
