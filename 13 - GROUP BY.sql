OPÇÃO 3

SELECT c.nome, sum(v.total_venda)
FROM cliente
INNER JOIN vendas v on v.id_cliente = c.id
WHERE v.dt_venda > '01/01/2019'
GROUP BY c.nome
ORDER BY nome