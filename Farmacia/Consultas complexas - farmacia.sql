# Consultas Complexas

-- Compra
-- Trazer as compras
SELECT * FROM compra;

-- Colocar o nome dos clientes na table compras
SELECT com.id as 'id Compra', cli.nome as 'Cliente', com.data as 'Data Compra' FROM compra as com, cliente as cli WHERE com.id = cli.id;

-- Produtos Compra
SELECT * FROM produtos_compra;

-- Colocar os dados da table
SELECT com.id as 'Venda', c.nome as 'Clinnte', SUM(p.preco * pc.quantidade) as 'Total', com.data as 'Data'
FROM cliente as c, produtos_compra as pc, compra as com, produtos as p WHERE com.id = pc.id_compra AND p.id = pc.id_produto AND c.id = com.id_cliente
group by com.id;


