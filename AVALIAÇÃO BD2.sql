CREATE DATABASE loja_pascotto;
USE loja_pascotto;

CREATE TABLE produtos(
idProduto INT (12) PRIMARY KEY,
nome VARCHAR (255),
preço FLOAT (8),
qntd_em_estoque INT (16),
idFornecedor INT (12)
);

CREATE TABLE fornecedores(
idFornecedor INT (12) PRIMARY KEY,
nome VARCHAR (255),
cnpj INT (14),
telefone INT (13),
cpf INT (11)
);

CREATE TABLE colaboradores(
idColaborador INT (12) PRIMARY KEY,
nome VARCHAR (255),
cargo VARCHAR (140),
salario FLOAT (12)
);

CREATE TABLE pedidos(
idPedido INT (12) PRIMARY KEY,
dataValidade INT (8),
idFuncionario INT (12),
idProduto INT (12),
quantidade INT (14)
);

ALTER TABLE fornecedores
ADD COLUMN email VARCHAR (255);

CREATE TABLE categorias(
idCategorias INT (12) PRIMARY KEY,
nomeCategoria VARCHAR (255)
); 

ALTER TABLE produtos
ADD COLUMN idCategorias INT (12);

ALTER TABLE produtos
DROP preço;

ALTER TABLE produtos
ADD COLUMN precos FLOAT (8);

INSERT INTO produtos (idProduto, nome, precos, qntd_em_estoque) values ("0526", "Toddy", "399", "10");
INSERT INTO fornecedores (idFornecedor, nome, cnpj) values ("0001", "Peixaria Firminho", "09890908");
INSERT INTO colaboradores (idColaborador, nome, cargo, salario) values ("01987", "Higor Fontneli", "Servo", "200");
INSERT INTO pedidos (idPedido, quantidade, dataValidade) values ("129023", "31", "21121213");

ALTER TABLE fornecedores
DROP cpf;

ALTER TABLE produtos
ADD CONSTRAINT fk_idCategorias FOREIGN KEY (idCategorias) REFERENCES produtos (idCategorias);