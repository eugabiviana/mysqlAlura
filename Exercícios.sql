/*Exercícios durante o curso*/
/*Quantos clientes possuem o último sobrenome Mattos? Resp: 2*/
select * from tabela_de_clientes where nome like '%Mattos';

/*Quais são os bairros da cidade do Rio de Janeiro que possuem clientes?*/

select distinct bairro from tabela_de_clientes where cidade = 'Rio de Janeiro';

/*Queremos obter as 10 primeiras vendas do dia 01/01/2017. Qual seria o comando SQL para obter este resultado?*/
select * from notas_fiscais where DATA_VENDA = '2017-01-01' limit 10;

/*Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto “Linha Refrescante - 1 Litro - Morango/Limão”, 
em quantidade? (Obtenha este resultado usando 2 SQLs).*/
select * from tabela_de_produtos where NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limão';
select * from itens_notas_fiscais where CODIGO_DO_PRODUTO = 1101035 ORDER BY quantidade desc;

/*Aproveitando o exercício do vídeo anterior, quantos itens de venda existem com a maior quantidade do produto '1101035'? Resp:79*/
SELECT MAX(QUANTIDADE) as 'MAIOR QUANTIDADE' FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' ;
SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;

/*Quais foram os clientes que fizeram mais de 2000 compras em 2016? Resp: 3*/
  SELECT CPF, COUNT(*) FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF
  HAVING COUNT(*) > 2000;
  
 /*Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos,
 nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. Liste o nome do cliente
 e esta classificação*/
SELECT NOME,
CASE 
	WHEN YEAR(data_de_nascimento) < 1990 THEN 'Velho'
	WHEN YEAR(data_de_nascimento) >= 1990 AND
	YEAR(data_de_nascimento) <= 1995 THEN 'Jovens' 
ELSE 'Crianças' 
END
FROM tabela_de_clientes;

/*Obtenha o faturamento anual da empresa. Leve em consideração que o valor financeiro das vendas
consiste em multiplicar a quantidade pelo preço */;
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

/*Obtenha o faturamento anual da empresa. Leve em consideração que o valor financeiro das vendas consiste em multiplicar
a quantidade pelo preço.*/
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

/*Qual seria a consulta usando subconsulta que seria equivalente a:*/
  SELECT CPF, COUNT(*) FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF
  HAVING COUNT(*) > 2000;
  /*Resp do instrutor:*/
  SELECT X.CPF, X.CONTADOR FROM 
(SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF) X WHERE X.CONTADOR > 2000;

/*Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).*/
Select concat(nome,' (',endereco_1, ', ', bairro,', ',cidade,', ', estado) AS COMPLEMENTO from tabela_de_clientes;

/*Crie uma consulta que mostre o nome e a idade atual dos clientes.*/
SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE
FROM  tabela_de_clientes; 

/*Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens temos a quantidade e o faturamento.
Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.*/
SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);

/*Queremos construir um SQL cujo resultado seja, para cada cliente:
“O cliente João da Silva faturou 120000 no ano de 2016”.
Somente para o ano de 2016*/
SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(ROUND(SUM(INF.QUANTIDADE * INF.preco),2) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA);

/*Nesta aula construímos um relatório que apresentou os clientes que tiveram vendas inválidas.
Complemente este relatório listando somente os que tiveram vendas inválidas e calculando a diferença entre
o limite de venda máximo e o realizado, em percentuais.
*Dica:
Capture a SQL final da aula.
Filtre somente as linhas onde
(X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0
Liste a coluna de X.QUANTIDADE_LIMITE
Crie uma nova coluna fazendo a fórmula:
(1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100*/

SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
ELSE 'VÁLIDA' END AS STATUS_VENDA, (1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100 AS PERCENTUAL
FROM (SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO
, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS 
, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X
WHERE (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;

/*Modifique o relatório mas agora para ver o ranking das vendas por tamanho.
Dica: Pode parecer difícil mas este é o exercício mais fácil de resolver.
Resposta do instrutor:*/
SELECT VENDA_TAMANHO.TAMANHO, VENDA_TAMANHO.ANO, VENDA_TAMANHO.QUANTIDADE,
ROUND((VENDA_TAMANHO.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.TAMANHO, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)) AS VENDA_TAMANHO
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_TAMANHO.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_TAMANHO.QUANTIDADE DESC;
