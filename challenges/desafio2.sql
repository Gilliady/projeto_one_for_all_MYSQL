SELECT 
    COUNT(DISTINCT musicas.musica_id) as cancoes,
    COUNT(DISTINCT artistas.artista_id) as artistas,
    COUNT(DISTINCT albuns.album_id) as albuns
    FROM artistas, albuns, musicas;