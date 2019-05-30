-- Henrique Mendes de Freitas Mariano - 17/0012280
-- Q1
SELECT * FROM ATOR;

-- Q2
SELECT f.titulo as "Título", c.descricao as "Categoria" FROM FILME f
JOIN CATEGORIA c ON f.codCat = c.codCat;

-- Q3
SELECT f.titulo as "Título", a.nreal as "Nome Real" FROM FILME f
JOIN FILME_ATOR fa ON f.codFilme = fa.codFilme
JOIN ATOR a ON fa.codAtor = a.codAtor;

-- Q4
/*
SELECT f.titulo as "Título", a.nreal as "Nome Real" FROM FILME f
LEFT JOIN FILME_ATOR fa ON f.codFilme = fa.codFilme
LEFT JOIN ATOR a ON a.codAtor = fa.codAtor 
UNION
SELECT f.titulo as "Título", a.nreal as "Nome Real" FROM FILME f
RIGHT JOIN FILME_ATOR fa ON f.codFilme = fa.codFilme
RIGHT JOIN ATOR a ON a.codAtor = fa.codAtor;
*/

SELECT f.titulo as "Título", a.nreal as "Nome Real" FROM FILME f
FULL OUTER JOIN FILME_ATOR fa ON f.codFilme = fa.codFilme
FULL OUTER JOIN ATOR a ON a.codAtor = fa.codAtor;

-- Q5
SELECT f.titulo as "Título", a.nreal as "Nome Real" FROM ATOR a
JOIN FILME_ATOR fa ON a.codAtor = fa.codAtor
JOIN FILME f ON fa.codFilme = f.codFilme
WHERE fa.codFilme = (SELECT x.codFilme FROM FILME x
					 JOIN FILME_ATOR y ON x.codFilme = y.codFilme
					 JOIN ATOR w ON y.codAtor = w.codAtor
                     WHERE w.nreal = 'Gloria Pires'
                     )
ORDER BY a.nreal;

-- Q6
SELECT a.nreal as "Nome Real" FROM ATOR a
WHERE a.nreal LIKE 'A%';

-- Q7
SELECT COUNT(*) as "Número de Clientes" FROM CLIENTE;

-- Q8
SELECT DISTINCT c.nome as "Nome do Cliente" FROM CLIENTE c
JOIN LOCACAO l ON c.codCli = l.codCli;

-- Q9
SELECT c.nome as "Nome do Cliente", l.codLoc as "Código de locação" FROM CLIENTE c
JOIN LOCACAO l ON c.codCli = l.codCli;

-- Q10
-- interpretação 1
SELECT tab1.nome as "Nome do Cliente", tab1.codLoc as "Código de locação" FROM
(SELECT nome, codLoc FROM CLIENTE c JOIN LOCACAO l ON c.codCli = l.codCli) tab1
JOIN
(SELECT nome, codLoc FROM CLIENTE c JOIN LOCACAO l ON c.codCli = l.codCli) tab2
ON tab1.codLoc != tab2.codLoc AND tab1.nome = tab2.nome;
 
-- interpretação 2
SELECT j.nome as "Nome do Cliente", l.codLoc as "Código de locação" FROM (
	SELECT CLIENTE.codCli, COUNT(CLIENTE.nome) AS cnome
	FROM CLIENTE
	JOIN LOCACAO ON CLIENTE.codCli = LOCACAO.codCli
	GROUP BY CLIENTE.codCli
	HAVING COUNT(CLIENTE.codCli) > 1
) c 
JOIN CLIENTE j ON c.codCli = j.codCli 
JOIN LOCACAO l ON c.codCli = l.codCli;
