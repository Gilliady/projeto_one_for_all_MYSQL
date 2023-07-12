SELECT m.musica_nome as cancao,
    COUNT(me.musica_id) as reproducoes
    FROM musicas as m
    INNER JOIN musicas_escutadas as me
    ON m.musica_id = me.musica_id
    GROUP BY m.musica_id
    ORDER BY reproducoes DESC, cancao
    LIMIT 2;