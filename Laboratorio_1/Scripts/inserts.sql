-- Apagando os valores das tabelas para realizar o preenchimento novamente
DELETE FROM TB_Cliente;
DELETE FROM TB_Telefone;
DELETE FROM TB_Categoria;
DELETE FROM TB_Filme;
DELETE FROM TB_Fita;
DELETE FROM TB_Ator;
DELETE FROM TB_Filme_Estrela_Ator;

-- TB_Cliente --
INSERT INTO TB_Cliente (idAssociado, nome, endereco)
VALUES (1, 'Tom Holland', 'Samambaia');

INSERT INTO TB_Cliente (idAssociado, nome, endereco)
VALUES (2, 'Robert Jr', 'Samambaia');

INSERT INTO TB_Cliente (idAssociado, nome, endereco)
VALUES (3, 'Marco', 'Samambaia');

INSERT INTO TB_Cliente (idAssociado, nome, endereco)
VALUES (4, 'João', 'Brazlândia');

INSERT INTO TB_Cliente (idAssociado, nome, endereco)
VALUES (5, 'Vinícius', 'Brazlândia');

-- TB_Telefone --
INSERT INTO TB_Telefone (telefone, FK_idCliente)
VALUES ('61998525547', 1);

INSERT INTO TB_Telefone (telefone, FK_idCliente)
VALUES ('61998525589', 2);

INSERT INTO TB_Telefone (telefone, FK_idCliente)
VALUES ('61987825547', 3);

INSERT INTO TB_Telefone (telefone, FK_idCliente)
VALUES ('61998525555', 4);

INSERT INTO TB_Telefone (telefone, FK_idCliente)
VALUES ('61998525588', 5);

-- TB_Categoria --
INSERT INTO TB_Categoria (idCategoria, nome_categoria)
VALUES (1, 'Terror');

INSERT INTO TB_Categoria (idCategoria, nome_categoria)
VALUES (2, 'Comédia');

INSERT INTO TB_Categoria (idCategoria, nome_categoria)
VALUES (3, 'Ação');

INSERT INTO TB_Categoria (idCategoria, nome_categoria)
VALUES (4, 'Drama');

INSERT INTO TB_Categoria (idCategoria, nome_categoria)
VALUES (5, 'Fantasia');

INSERT INTO TB_Categoria (idCategoria, nome_categoria)
VALUES (6, 'Ficção Cientifica');

-- TB_Filme --
INSERT INTO TB_Filme (idFilme, titulo, FK_idCategoria)
VALUES (1, 'Vingadores Guerra Infinita', 3);

INSERT INTO TB_Filme (idFilme, titulo, FK_idCategoria)
VALUES (2, 'Vingadores Ultimato', 3);

INSERT INTO TB_Filme (idFilme, titulo, FK_idCategoria)
VALUES (3, 'Interestelar', 6);

INSERT INTO TB_Filme (idFilme, titulo, FK_idCategoria)
VALUES (4, 'Um Sonho de Liberdade', 4);

INSERT INTO TB_Filme (idFilme, titulo, FK_idCategoria)
VALUES (5, 'O Senhor dos Anéis - A Sociedade do Anel ', 5);

-- TB_Fita --
INSERT INTO TB_Fita (idFita, FK_idFilme, FK_idCliente)
VALUES (1, 2, 2);

INSERT INTO TB_Fita (idFita, FK_idFilme, FK_idCliente)
VALUES (2, 1, 1);

INSERT INTO TB_Fita (idFita, FK_idFilme, FK_idCliente)
VALUES (3, 5, 3);

INSERT INTO TB_Fita (idFita, FK_idFilme, FK_idCliente)
VALUES (4, 3, 5);

INSERT INTO TB_Fita (idFita, FK_idFilme, FK_idCliente)
VALUES (5, 4, 4);

-- TB_Ator --
INSERT INTO TB_Ator (idAtor, nome_real, data_nasc)
VALUES (1, 'Chris Evans', '2019-06-13');

INSERT INTO TB_Ator (idAtor, nome_real, data_nasc)
VALUES (2, 'Robert Downey Jr.', '1965-04-04');

INSERT INTO TB_Ator (idAtor, nome_real, data_nasc)
VALUES (3, 'Elijah Wood', '1981-01-28');

INSERT INTO TB_Ator (idAtor, nome_real, data_nasc)
VALUES (4, 'Matthew McConaughey', '1969-11-04');

INSERT INTO TB_Ator (idAtor, nome_real, data_nasc)
VALUES (5, 'Morgan Freeman', '1937-06-01');

-- TB_Filme_Estrela_Ator --
INSERT INTO TB_Filme_Estrela_Ator (FK_idFilme, FK_idAtor, nome_ficticio)
VALUES (2, 2, 'Tony Stark');

INSERT INTO TB_Filme_Estrela_Ator (FK_idFilme, FK_idAtor, nome_ficticio)
VALUES (1, 1, 'Steve Rogers');

INSERT INTO TB_Filme_Estrela_Ator (FK_idFilme, FK_idAtor, nome_ficticio)
VALUES (5, 3, 'Frodo Baggins');

INSERT INTO TB_Filme_Estrela_Ator (FK_idFilme, FK_idAtor, nome_ficticio)
VALUES (3, 4, 'Cooper');

INSERT INTO TB_Filme_Estrela_Ator (FK_idFilme, FK_idAtor, nome_ficticio)
VALUES (4, 5, 'Ellis Boyd Redding');