# Atualizando Dados

-- table tipos_produtos
SELECT * FROM tipos_produto;

-- update campo outros
UPDATE tipos_produto SET tipo = 'Maquiagem' WHERE id = 4;

-- table Produtos
SELECT * FROM produtos;

UPDATE produtos SET preco = 4.16, id_fabricante = 2, id_tipo_produto = 2 WHERE id = 3;

# Exluindo Dados

-- table produtos_compra

SELECT * FROM produtos_compra;

DELETE FROM produtos_compra WHERE id = 3;

