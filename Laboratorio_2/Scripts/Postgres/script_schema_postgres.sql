-- CREATE DATABASE Locadora;

DROP DOMAIN IF EXISTS UINT16 CASCADE;
DROP TABLE IF EXISTS FILME_ATOR;
DROP TABLE IF EXISTS ATOR;
DROP TABLE IF EXISTS LOC_FITA;
DROP TABLE IF EXISTS FITA;
DROP TABLE IF EXISTS FILME;
DROP TABLE IF EXISTS CATEGORIA;
DROP TABLE IF EXISTS LOCACAO;
DROP TABLE IF EXISTS CLIENTE;

CREATE DOMAIN UINT16 AS INT
CHECK(VALUE >= 0 AND VALUE < 2147483648);

CREATE TABLE  CLIENTE
	(codCli		SERIAL PRIMARY KEY,
	 nome 		varchar(65) NOT NULL,
	 endereco	varchar(150) NOT NULL,
	 fone		INTEGER);



CREATE TABLE LOCACAO
	(codLoc		SERIAL PRIMARY KEY,
	 codCli		SERIAL references Cliente(codCli),
	 dtInicio 	date,
	 dtFim		date);


CREATE TABLE  CATEGORIA
	(codCat		SERIAL PRIMARY KEY,
	 descricao	varchar(30) NOT NULL);



CREATE TABLE FILME
	(codFilme	SERIAL PRIMARY KEY,
	 titulo		varchar(65) NOT NULL,
	 codCat		UINT16,
	 FOREIGN KEY(codCat) references CATEGORIA(codCat));


CREATE TABLE FITA
	(codFita	SERIAL PRIMARY KEY,
	 codFilme	SERIAL references Filme(codFilme),
	 parte		char(1) );



CREATE TABLE LOC_FITA
	(codFita	SERIAL references Fita(CodFita),
	 codLoc		SERIAL references Locacao(codLoc),
	PRIMARY KEY (codFita, codLoc));



CREATE TABLE ATOR
	(codAtor	SERIAL PRIMARY KEY,
	 nreal		varchar(65) NOT NULL,
	 nFan		varchar(65) NOT NULL,
	 dtNasc		date);


CREATE TABLE FILME_ATOR
	(codFilme	SERIAL references Filme(codFilme),
	 codAtor	SERIAL references Ator(codAtor));


ALTER TABLE FILME_ATOR
ADD PRIMARY KEY (codFilme, codAtor);

insert into CLIENTE(nome, endereco, fone) values('Maria da Silva', 'BSB', '12341234');
insert into CLIENTE(nome, endereco, fone) values('Jose Geraldo', 'São Paulo', '13243647');
insert into CLIENTE(nome, endereco, fone) values('Marcos da Silva', 'Rio de Janeiro', '34678923');
insert into CLIENTE(nome, endereco, fone) values('Marcelo Oliveira', 'Belem', '13579323');
insert into CLIENTE(nome, endereco, fone) values('Marcos Antonio', 'Pará', '73839581');



insert into LOCACAO(codCli, dtInicio, dtFim) values(1, '2009-02-02', '2009-02-05');
insert into LOCACAO(codCli, dtInicio, dtFim) values(1, '2009-02-02', '2009-02-05');
insert into LOCACAO(codCli, dtInicio, dtFim) values(2, '2009-05-02', '2009-05-05');
insert into LOCACAO(codCli, dtInicio, dtFim) values(3, '2009-02-10', '2009-02-12');
insert into LOCACAO(codCli, dtInicio, dtFim) values(3, '2009-02-15', '2009-02-17');



insert into CATEGORIA(descricao) values('Ação');
insert into CATEGORIA(descricao) values('Comédia');
insert into CATEGORIA(descricao) values('Desenho');
insert into CATEGORIA(descricao) values('Terror');
insert into CATEGORIA(descricao) values('Romance');


insert into FILME(titulo, codCat) values('Titanic', 5);
insert into FILME(titulo, codCat) values('Se eu fosse voce', 3);
insert into FILME(titulo, codCat) values('Poderoso Chefão', 1);
insert into FILME(titulo, codCat) values('Os Vagabundos Trapalhões', 2);
insert into FILME(titulo, codCat) values('Massaropi', 2);


insert into FITA(codFilme, parte) values(1, '1');
insert into FITA(codFilme, parte) values(1, '1');
insert into FITA(codFilme, parte) values(2, '1');
insert into FITA(codFilme, parte) values(2, '2');
insert into FITA(codFilme, parte) values(3, '1');


insert into LOC_FITA(codLoc, codFita) values(1, 1);
insert into LOC_FITA(codLoc, codFita) values(2, 2);
insert into LOC_FITA(codLoc, codFita) values(3, 3);
insert into LOC_FITA(codLoc, codFita) values(4, 4);
insert into LOC_FITA(codLoc, codFita) values(5, 5);


insert into ATOR(nreal, nFan, dtNasc) values('Leonardo DiCaprio', 'Leonardo DiCaprio', '1980-03-19');
insert into ATOR(nreal, nFan, dtNasc) values('Kate Winslet', 'Kate Winslet', '1983-12-19');
insert into ATOR(nreal, nFan, dtNasc) values('Antônio de Carvalho Barbosa', 'Toni Ramos', '1956-03-01');
insert into ATOR(nreal, nFan, dtNasc) values('Antonio Rentao Aragao', 'Didi', '1980-05-20');
insert into ATOR(nreal, nFan, dtNasc) values('Gloria Pires', 'Gloria Pires', '1980-07-19');


insert into FILME_ATOR(codFilme, codAtor) values(1, 1);
insert into FILME_ATOR(codFilme, codAtor) values(1, 2);
insert into FILME_ATOR(codFilme, codAtor) values(2, 3);
insert into FILME_ATOR(codFilme, codAtor) values(2, 5);
insert into FILME_ATOR(codFilme, codAtor) values(4, 4);