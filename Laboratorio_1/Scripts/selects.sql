-- Selecao de todas as colunas dos clientes na tabela de clientes --
SELECT * FROM TB_Cliente;

-- Selecao dos nomes, telefones e endereços dos clientes ordenados de forma ascendente pelo idAssociado dos clientes --
SELECT c.nome, tel.telefone, c.endereco FROM TB_Cliente c
JOIN TB_Telefone tel ON tel.FK_idCliente = c.idAssociado
ORDER BY c.idAssociado ASC;

-- Selecao dos ids das fitas e os nomes dos filmes que os clientes alugaram --
SELECT fita.idFita, c.nome, filme.titulo FROM TB_Cliente c
JOIN TB_Fita fita ON fita.FK_idCliente = c.idAssociado
JOIN TB_Filme filme ON fita.FK_idFilme = filme.idFilme;

-- Selecao dos filmes que possuem a categoria acao --
SELECT f.titulo, c.nome_categoria FROM TB_Filme f
JOIN TB_Categoria c ON f.FK_idCategoria = c.idCategoria
WHERE c.nome_categoria = 'Ação';

-- Selecao de filmes que possuem atores que os estrelam com o nome comecando com 'M' e suas datas de nascimento --
SELECT f.titulo, a.nome_real, a.data_nasc FROM TB_Filme f
JOIN TB_Filme_Estrela_Ator fa ON fa.FK_idFilme = f.idFilme
JOIN TB_Ator a ON fa.FK_idAtor = a.idAtor
WHERE a.nome_real LIKE 'M%';