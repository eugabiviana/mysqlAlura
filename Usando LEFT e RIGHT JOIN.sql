/*LEFT JOIN: retorna todos da tabela da esquerda e somente os correspondentes da direita*/
/*RIGHT JOIN: retorna todos da tabela da direita e somente os correspondentes da esquerda*/
SELECT COUNT(*) FROM tabela_de_clientes;

SELECT CPF, COUNT(*) FROM notas_fiscais GROUP BY CPF;

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
INNER JOIN notas_fiscais B ON A.CPF = B.CPF; /*mostra todos que tem NFs*/

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF /*se fizer a consulta até aqui, mostrará todos cadastrados, com e sem NF (null)*/
WHERE B.CPF IS NULL; /*aqui mostra os que não tem NFs*/

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM notas_fiscais B
RIGHT JOIN tabela_de_clientes A ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA) = 2015

