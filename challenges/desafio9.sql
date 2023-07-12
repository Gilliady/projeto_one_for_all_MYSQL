SELECT 
	COUNT(*) AS musicas_no_historico
    FROM musicas_escutadas AS me
    INNER JOIN usuarios AS u ON u.usuario_id = me.usuario_id
    WHERE u.usuario_nome = 'Barbara Liskov';