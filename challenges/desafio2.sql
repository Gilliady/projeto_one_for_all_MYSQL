SELECT 
    COUNT(DISTINCT musicas.musica_id) AS cancoes,
    COUNT(DISTINCT artistas.artista_id) AS artistas,
    COUNT(DISTINCT albuns.album_id) AS albuns
    FROM artistas, albuns, musicas;