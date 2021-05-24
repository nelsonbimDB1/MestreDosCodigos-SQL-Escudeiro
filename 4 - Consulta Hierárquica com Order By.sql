WITH Usuario_CTE AS
(
	SELECT
		Id,
		Nome,
		UsuarioIndicacaoId,
		CAST(ROW_NUMBER() OVER(PARTITION BY UsuarioIndicacaoId ORDER BY nome) as varchar(max)) as Hierarquia,
		0 as level,
		ROW_NUMBER() OVER(PARTITION BY UsuarioIndicacaoId ORDER BY nome) / POWER(10.0,0) as  Ordem 
	FROM Usuarios
	WHERE COALESCE(UsuarioIndicacaoId, 0) = 0

	UNION ALL

	SELECT
		u.Id,
		u.Nome,
		u.UsuarioIndicacaoId,
		Hierarquia +'-'+ CAST(ROW_NUMBER() OVER(PARTITION BY u.UsuarioIndicacaoId ORDER BY u.nome) AS VARCHAR(MAX)),
		level+1,
		Ordem + ROW_NUMBER() OVER(PARTITION BY u.UsuarioIndicacaoId ORDER BY u.nome) / POWER(10.0,level+1) 
	FROM
		Usuario_CTE cte
	INNER JOIN Usuarios u ON cte.Id = u.UsuarioIndicacaoId
)
   
SELECT
    Id,
    Nome,
    UsuarioIndicacaoId,
    Hierarquia
FROM Usuario_CTE
ORDER BY Ordem