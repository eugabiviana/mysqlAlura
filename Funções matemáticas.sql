
SELECT (23+((25-2)/2)*45) AS RESULTADO;

SELECT CEILING(12.33333232323) AS RESULTADO; /*mostra só o valor inteiro. NÃO arredonda*/

SELECT ROUND(12.7777232323) AS RESULTADO; /*arredonda o valor*/

SELECT FLOOR(12.7777232323) AS RESULTADO; /*devolve o maior inteiro que seja menor ou igual a um número dado*/

SELECT RAND() AS RESULTADO;  /*randow: dá um número aleatório*/

SELECT NUMERO, QUANTIDADE, PRECO, QUANTIDADE * PRECO AS FATURAMENTO
 FROM ITENS_NOTAS_FISCAIS;  /*só multiplicando valores entre colunas*/
 
 SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO
 FROM ITENS_NOTAS_FISCAIS;  /*arrendondando casas decimais*/
