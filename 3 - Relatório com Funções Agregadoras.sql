-- RELATÓRIO DE MÉDIA DE VALOR DE PRODUTOS VINCULADOS A FORNECEDORES E O VALOR MÉDIO DO VALOR SEJA SUPERIOR A 10

SELECT F.Nome AS 'Fornecedor', MAX(p.Valor) as 'MaiorValorDeProduto', MIN(p.Valor) as 'MenorValorDeProduto', AVG(p.Valor) as 'MediaDeValoresDoProduto'
FROM DBO.Produtos P
INNER JOIN DBO.ProdutosFornecedores PF
	ON PF.ProdutoId = P.Id
INNER JOIN DBO.Fornecedores F
	ON PF.FornecedorId = F.Id
GROUP BY F.Nome
HAVING AVG(p.Valor) > 10