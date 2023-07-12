SELECT 
    usuario_nome as pessoa_usuaria,
    COUNT(mo.musica_id) as musicas_ouvidas,
    ROUND(SUM(m.musica_duracao / 60), 2) as total_minutos
    FROM usuarios
    INNER JOIN musicas_escutadas as mo ON usuarios.usuario_id = mo.usuario_id
    INNER JOIN musicas as m ON m.musica_id = mo.musica_id
    GROUP BY usuarios.usuario_nome
    ORDER BY usuarios.usuario_nome ASC;