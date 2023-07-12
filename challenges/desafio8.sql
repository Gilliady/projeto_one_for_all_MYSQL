SELECT 
	artista_nome AS artista,
    al.album_nome AS album
    FROM artistas AS a
    INNER JOIN albuns AS al ON al.artista_id = a.artista_id
    WHERE artista_nome = 'Elis Regina';