
SELECT CURRENT_TIMESTAMP() AS RESULTADO;

SELECT CONCAT('O dia de hoje é : ', CURRENT_TIMESTAMP()) AS RESULTADO;

SELECT CONCAT('O dia de hoje é : ', 
DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%m/%Y - %U') ) AS RESULTADO; /*para esse caso, olhar a documentação 
(https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format e/ou https://www.w3schools.com/sql/), 
pois cada letra significa uma coisa, e o resultado muda se escrita maiúscula ou minúscula*/

SELECT SUBSTRING(CONVERT(23.3, CHAR),1,1) AS RESULTADO;
