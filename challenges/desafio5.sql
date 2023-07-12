SELECT m.musica_nome AS cancao,
    COUNT(me.musica_id) AS reproducoes
    FROM musicas AS m
    INNER JOIN musicas_escutadas AS me
    ON m.musica_id = me.musica_id
    GROUP BY m.musica_id
    ORDER BY reproducoes DESC, cancao
    LIMIT 2;