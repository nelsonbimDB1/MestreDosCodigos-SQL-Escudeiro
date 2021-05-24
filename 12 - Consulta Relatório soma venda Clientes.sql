SELECT V.NOME AS 'Vendedor', C.NOME AS 'Cliente', SUM(COALESCE(VD.TOTALVENDA, 0))
FROM VENDEDOR V
LEFT JOIN VENDAS VD
	ON VD.VENDEDORID = V.ID
LEFT JOIN CLIENTE C
	ON C.ID = VD.CLIENTEID
GROUP BY V.NOME, C.NOME