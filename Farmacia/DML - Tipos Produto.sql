# Inserindo Dados - DML

-- Tipos Produto
INSERT INTO tipos_produto (tipo) VALUES ('Remédios');
INSERT INTO tipos_produto (tipo) VALUES ('Cosméticos');
INSERT INTO tipos_produto (tipo) VALUES ('Diversos');

-- Fabricantes

INSERT INTO	fabricantes (nome) VALUES ('Rock');
INSERT INTO	fabricantes (nome) VALUES ('Boticário');
INSERT INTO	fabricantes (nome) VALUES ('Natura');

-- Médicos

INSERT INTO medico(nome, especialidade, crm) VALUES ('Valdecir Campos', 'Oftalmologista', '135454SP');
INSERT INTO medico(nome, especialidade, crm) VALUES ('Nora Rodrigues', 'Dermatologista', '454542PR');
INSERT INTO medico(nome, especialidade, crm) VALUES ('Robson Nunes', 'Cardiologista', '546576MG');

-- Cliente

INSERT INTO cliente(nome, endereco, telefone, cep, localidade, cpf) VALUES ('João Farias', 'Rua maria luz, 95','41998563254', '96587780', 'Paraná', '85296374198');
INSERT INTO cliente(nome, endereco, telefone, cep, localidade, cpf) VALUES ('Maria Silva', 'Rua Laranjeira, 55','41965328754', '56124780', 'São Paulo', '56912485803');
INSERT INTO cliente(nome, endereco, telefone, cep, localidade, cpf) VALUES ('João Farias', 'Rua maria luz, 95','41998563254', '96587951', 'Paraná', '85296374198');

-- produtos

INSERT INTO produtos(nome, designcao, composicao, id_fabricante, preco, id_tipo_produto) VALUES ('Diporona', 'Dores em geral', 'Metil Propileno',1, 12.44, 1);
INSERT INTO produtos(nome, designcao, composicao, id_fabricante, preco, id_tipo_produto) VALUES ('Sabonete', 'Limpeza', 'Massa base vegetal', 3, 15.99, 2);
INSERT INTO produtos(nome, designcao, composicao, id_fabricante, preco, id_tipo_produto) VALUES ('Protetor solar', 'Proteção pele', 'Soro de Abacate', 1, 98.50, 3);

-- Compras

INSERT INTO compra(data, id_cliente) VALUES ('2024-05-01', 1);
INSERT INTO compra(data, id_cliente) VALUES ('2024-05-05', 3);
INSERT INTO compra(data, id_cliente) VALUES ('2024-05-02', 1);

-- Produtos_Compra

INSERT INTO produtos_compra(id_compra, id_produto, quantidade) VALUES (1, 1, 2);
INSERT INTO produtos_compra(id_compra, id_produto, quantidade) VALUES (2, 3, 3);
INSERT INTO produtos_compra(id_compra, id_produto, quantidade) VALUES (1, 2, 1);

-- Receita_Medicas

INSERT INTO receitas_medica(id_produto_compra, id_medico, receita) VALUES (1, 3 , 'Receita 1.pdf');
INSERT INTO receitas_medica(id_produto_compra, id_medico, receita) VALUES (2, 2 , 'Receita 2.pdf');





