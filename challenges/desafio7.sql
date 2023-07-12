SELECT 
	artista_nome AS artista,
    al.album_nome AS album,
    COUNT(ars.artista_id) AS pessoas_seguidoras
    FROM artistas AS a
    INNER JOIN albuns AS al ON al.artista_id = a.artista_id
    INNER JOIN artistas_seguidos AS ars ON ars.artista_id = a.artista_id
    GROUP BY album
    ORDER BY pessoas_seguidoras DESC, artista_nome, album;