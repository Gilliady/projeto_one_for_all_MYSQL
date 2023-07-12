SELECT 
    album_nome as album,
    COUNT(mf.musica_id) as favoritadas
    FROM albuns as al
    INNER JOIN musicas AS m USING (album_id)
    INNER JOIN musicas_favoritadas as mf USING (musica_id)
    GROUP BY album
    ORDER BY favoritadas DESC
    LIMIT 3;