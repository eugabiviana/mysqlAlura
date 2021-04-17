
SELECT LTRIM('    OLÁ') AS RESULTADO; /*Tira o espaço à esquerda da palavra no resultado da consulta*/

SELECT RTRIM('OLÁ     ') AS RESULTADO; /*Tira o espaço à direita da palavra no resultado da consulta*/

SELECT TRIM('    OLÁ    ') AS RESULTADO; /*Tira todos os espaços (esquerda e direita) da palavra no resultado da consulta*/

SELECT CONCAT('OLÁ', ' ', 'TUDO BEM','?') AS RESULTADO; /*Junta todas as expressões em uma única frase/consulta */

SELECT UPPER('olá, tudo bem?') AS RESULTADO; /*Deixa todas as letras maiúsculas*/

SELECT LOWER('OLÁ, TUDO BEM?') AS RESULTADO; /*Deixa todas as letras minúsculas*/

SELECT SUBSTRING('OLÁ, TUDO BEM?', 6) AS RESULTADO; /*Mostra a posição solicitada. Como nesse caso não tem parâmetro, 
mostrou toda a informação. 1O 2L 3Á 4, 5_, 6TUDO BEM?*/

SELECT SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO; /*Mesma coisa, mas agora com o parâmetro para mostrar 4 caracteres*/

SELECT CONCAT(NOME, ' (', CPF, ') ') AS RESULTADO FROM TABELA_DE_CLIENTES; /*Juntou duas informações em uma única linha*/









