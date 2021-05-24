-- BUSCANDO ITENS COM VALOR MENOR QUE 80 OU QUE ESTEJA VINCULADO Á ALGUM FORNECEDOR

SELECT Id, Nome, Valor 
FROM Produtos
WHERE Valor < 80

UNION

SELECT p.Id, p.Nome, p.Valor
FROM Produtos p
LEFT JOIN ProdutosFornecedores pf
	ON p.Id = pf.ProdutoId
WHERE pf.ProdutoId IS NOT NULL


-- BUSCANDO PRODUTOS QUE EXISTAM APENAS NAS DUAS TABELAS

SELECT p.Id, p.Nome, p.Valor
FROM Produtos p
LEFT JOIN ProdutosFornecedores pf
	ON p.Id = pf.ProdutoId

INTERSECT

SELECT p.Id, p.Nome, p.Valor
FROM Produtos p
RIGHT JOIN ProdutosFornecedores pf
	ON p.Id = pf.ProdutoId
RIGHT JOIN Fornecedores f
	ON f.Id = pf.FornecedorId

-- FORMA FÁCIL DE BUSCAR O RESULTADO ACIMA

SELECT p.Id, p.Nome, p.Valor
FROM Produtos p
INNER JOIN ProdutosFornecedores pf
	ON p.Id = pf.ProdutoId



-- BUSCANDO PRODUTOS QUE NA PRINEIRA CONSULTA, DESCONSIDERANDO O QUE CONTENHA NA SEGUNDA CONSULTA

SELECT p.Id, p.Nome, p.Valor
FROM Produtos p
LEFT JOIN ProdutosFornecedores pf
	ON p.Id = pf.ProdutoId

EXCEPT  /* Minus é uma operação para Oracle */ 

SELECT p.Id, p.Nome, p.Valor
FROM Produtos p
RIGHT JOIN ProdutosFornecedores pf
	ON p.Id = pf.ProdutoId
RIGHT JOIN Fornecedores f
	ON f.Id = pf.FornecedorId


-- Buscando Todos os produtos relacionados com fornecedores incluindo na consulta os produtos que não estão vinculados a nenhum fornecedor

SELECT pf.ProdutoId, pf.FornecedorId, p.Id, p.Nome, p.Valor
FROM ProdutosFornecedores pf
RIGHT OUTER JOIN Produtos p
	ON p.Id = pf.ProdutoId
ORDER BY CASE WHEN ProdutoId IS NULL Then 1 else 0 end, PF.ProdutoId

-- Buscando Todos os produtos relacionados com fornecedores excluindo da consulta os produtos que não estão vinculados a nenhum fornecedor

SELECT pf.ProdutoId, pf.FornecedorId, p.Id, p.Nome, p.Valor
FROM ProdutosFornecedores pf
LEFT OUTER JOIN Produtos p
	ON p.Id = pf.ProdutoId
ORDER BY CASE WHEN ProdutoId IS NULL Then 1 else 0 end, PF.ProdutoId
