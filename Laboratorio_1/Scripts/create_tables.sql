CREATE DATABASE IF NOT EXISTS Locadora;

CREATE TABLE IF NOT EXISTS TB_Cliente (
	idAssociado INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS TB_Telefone (
	telefone CHAR(11) NOT NULL,
    FK_idCliente INT NOT NULL REFERENCES TB_Cliente(idAssociado),
    PRIMARY KEY (telefone, FK_idCliente)
);

CREATE TABLE IF NOT EXISTS TB_Fita (
	idFita INT PRIMARY KEY,
    FK_idFilme INT NOT NULL REFERENCES TB_Filme(idFilme),
    FK_idCliente INT NOT NULL REFERENCES TB_Cliente(idAssociado)  
);

CREATE TABLE IF NOT EXISTS TB_Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    FK_idCategoria INT NOT NULL REFERENCES TB_Categoria(idCategoria)
);

CREATE TABLE IF NOT EXISTS TB_Categoria (
	idCategoria INT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS TB_Filme_Estrela_Ator (
	FK_idFilme INT NOT NULL REFERENCES TB_Filme(idFilme),
    FK_idAtor INT NOT NULL REFERENCES TB_Ator(idAtor),
    nome_ficticio VARCHAR(100),
    PRIMARY KEY(FK_idFilme, FK_idAtor)
);

CREATE TABLE IF NOT EXISTS TB_Ator (
	idAtor INT PRIMARY KEY,
    nome_real VARCHAR(100) NOT NULL,
    data_nasc DATE
);