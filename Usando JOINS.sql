/*Visualizando o conteúdo de duas tabelas relacionadas*/

SELECT * FROM tabela_de_vendedores;
SELECT * FROM notas_fiscais;

/*INNER JOIN: retorna somente quando temos CHAVES correspondentes*/
SELECT * FROM tabela_de_vendedores A /*está definindo um nome para a tabela_de_vendedores, no caso, A*/
INNER JOIN notas_fiscais B /*está definindo um nome para notas_fiscais, no caso, B*/
ON A.MATRICULA = B.MATRICULA; /*aqui mostra a junção das duas tabelas correspondentes, de acordo com a MATRICULA*/

/*O mais usado*/
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA 
GROUP BY A.MATRICULA, A.NOME;

/*não é mais usado, mas traz a mesma informação*/
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores A, notas_fiscais B
WHERE A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;



/*FULL JOIN: retorna todos os registro de todas as tabelas*/

/*CROSS JOIN: retorna o produto cartesiano das duas tabelas, ou seja, cruza todas as informações */
/**/
/**/
/**/