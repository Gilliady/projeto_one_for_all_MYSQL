SELECT 
	COUNT(*) as musicas_no_historico
    FROM musicas_escutadas as me
    INNER JOIN usuarios as u ON u.usuario_id = me.usuario_id
    WHERE u.usuario_nome = 'Barbara Liskov';