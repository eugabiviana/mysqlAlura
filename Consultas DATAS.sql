
SELECT CURDATE(); /*Mostra o dia atual*/

SELECT CURRENT_TIME(); /*Mostra a hora atual*/

SELECT CURRENT_TIMESTAMP(); /*Data e hora atual com hora, minutos e segundos*/

SELECT YEAR(CURRENT_TIMESTAMP()); /*mostra o ano*/

SELECT DAY(CURRENT_TIMESTAMP()); /*mostra o dia*/

SELECT MONTH(CURRENT_TIMESTAMP()); /*mostra o mês*/

SELECT MONTHNAME(CURRENT_TIMESTAMP()); /*mostra o nome do mês*/

SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2019-01-01') AS RESULTADO; /*mostra quantos dias se passaram até a data atual, desde o parâmetro
definido, nesse caso, desde 1º de jan de 2019*/

SELECT DATEDIFF(CURRENT_TIMESTAMP(), '1988-07-25') AS RESULTADO;  /*quantos dias vivi? =D */

SELECT CURRENT_TIMESTAMP() AS DIA_HOJE
, DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS RESULTADO;  /*Diminuindo 5 dias a partir da data de hoje/atual*/

SELECT DISTINCT DATA_VENDA,
DAYNAME(DATA_VENDA) AS DIA, MONTHNAME(DATA_VENDA) AS MES
, YEAR(DATA_VENDA) AS ANO FROM NOTAS_FISCAIS;  /*mostrando os nomes das datas da tabela*/


