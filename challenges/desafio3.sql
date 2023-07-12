SELECT 
    usuario_nome AS pessoa_usuaria,
    COUNT(mo.musica_id) AS musicas_ouvidas,
    ROUND(SUM(m.musica_duracao / 60), 2) AS total_minutos
    FROM usuarios
    INNER JOIN musicas_escutadas AS mo ON usuarios.usuario_id = mo.usuario_id
    INNER JOIN musicas AS m ON m.musica_id = mo.musica_id
    GROUP BY usuarios.usuario_nome
    ORDER BY usuarios.usuario_nome ASC;