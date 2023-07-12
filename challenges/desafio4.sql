SELECT 
    usuario_nome as pessoa_usuaria,
    IF(MAX(YEAR(me.musica_data_reproducao)) >= 2021, 'Ativa', 'Inativa') as status_pessoa_usuaria
    FROM usuarios
    INNER JOIN musicas_escutadas as me ON me.usuario_id = usuarios.usuario_id
    GROUP BY usuarios.usuario_nome
    ORDER BY usuarios.usuario_nome;