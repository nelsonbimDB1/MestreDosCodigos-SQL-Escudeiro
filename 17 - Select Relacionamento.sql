OPÇÂO 1

SELECT c.nome, c.email
         FROM cliente c
         INNER JOIN vendas v on v.clienteID = c.id
         WHERE v.dt_venda > '01/01/2019'
         ORDER BY 1