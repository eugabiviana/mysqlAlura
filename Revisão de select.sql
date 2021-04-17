use sucos_vendas;

select * from tabela_de_clientes; /* o asterisco seleciona todas as colunas, mas eu posso escolher o que consultar*/

select NOME, CPF from tabela_de_clientes;

select CPF as IDENTIFICADOR, NOME as CLIENTE from tabela_de_clientes; /*Nesse caso, modifico o nome da coluna durante a consulta. 
É temporário!*/

select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '1000889'; /*forma de escolher uma informação específica*/

select * from tabela_de_produtos where PRECO_DE_LISTA = 19.51; /*Nesse caso, preco_de_lista é float, ou seja, ele arredonda o valor. 
Por isso o mysql não consegue informar o que foi solicitado. Para isso: */

select * from tabela_de_produtos where PRECO_DE_LISTA between 19.50 and 19.52;

select * from tabela_de_produtos where PRECO_DE_LISTA <= 19.51; /*Maior ou igual*/

select * from tabela_de_produtos where PRECO_DE_LISTA >= 19.51; /*Menor ou igual*/

select * from tabela_de_produtos where PRECO_DE_LISTA <> 19.51; /*Diferente de*/

/*Buscas com AND e/ou OR: fazem as verificações de V e F e trazem o resultado (consultas condicionais).*/
select * from tabela_de_produtos where sabor = 'manga'
or tamanho = '470 ml';

select * from tabela_de_produtos where sabor = 'manga'
and tamanho = '470 ml';

/*exemplo de inversão da lógica, onde o resultado é diferente da excessão definida*/
select * from tabela_de_produtos where not (sabor = 'manga'
and tamanho = '470 ml');

select * from tabela_de_produtos where not (sabor = 'manga'
or tamanho = '470 ml');

select * from tabela_de_produtos where sabor = 'manga'
and not (tamanho = '470 ml');

/*Buscas equivalentes (só muda a forma de escrever):*/
select * from tabela_de_produtos where sabor in ('manga', 'laranja');
select * from tabela_de_produtos where sabor = 'manga' or sabor = 'laranja';

/*Mesclando condições:*/
select * from tabela_de_clientes where cidade in ('Rio de Janeiro', 'São Paulo')
and idade >= 20;

select * from tabela_de_clientes where cidade in ('Rio de Janeiro', 'São Paulo')
and (idade >= 19 and idade <=21); /*entre parênteses só para ficar mais organizado*/

/*Consultas com o LIKE E %: 
maça%: mostra o que inicia com maça;
%maça%: mostra qualquer um que tenha maça no nome e em qualquer parte;
%maça: final maça. */
select * from tabela_de_produtos where sabor like '%maça%';

select * from tabela_de_produtos where sabor like '%maça%' and embalagem = 'pet';

/*Uso do DISTINCT: mostra todas as informações, sem repetir dados*/
select embalagem, tamanho from tabela_de_produtos; /*Esse caso mostra todas as informações da tabela e linhas repetidas, como é o caso
													das garrafas de 700 ml e PET 2 litros*/
                                                    
select DISTINCT embalagem, tamanho from tabela_de_produtos; /*Já com o DISTINCT, as informações não se repetem, aparece apenas uma de cada
															valor solicitado*/
                                                            
select DISTINCT embalagem, tamanho from tabela_de_produtos where sabor = 'laranja';      

select DISTINCT embalagem, tamanho, sabor from tabela_de_produtos; /*Aumentei o leque de busca, pois agora mostras todos os sabores*/                                                      

/*Usando o LIMIT*/
select *from tabela_de_produtos LIMIT 5; /*mostra os 5 primeiros da tabela*/

select *from tabela_de_produtos LIMIT 2,3; /*mostra 3 produtos a partir da posição 2 (lembrando que a posição do produto segue
a lógica de matriz, logo, o número 2 equivale ao produto 3! */

select *from tabela_de_produtos LIMIT 0,2; /*para mostrar o PRIMEIRO produto, coloca 0, pois essa é a posição equivalente */

/*ORDER BY ASC/DESC*/
select * from tabela_de_produtos ORDER BY PRECO_DE_LISTA; /*Se não colocar o parâmetro, ele já entende que é na ordem 
															ascendente (alfabética e crescente, no caso de números).*/
														
select * from tabela_de_produtos ORDER BY PRECO_DE_LISTA desc; /*Maior valor para o menor*/

select * from tabela_de_produtos ORDER BY embalagem, NOME_DO_PRODUTO; /*Ordena os dois pâmetros: nome do produto em ordem alfabética
																		e a da embalagem também (garrafa vem primeiro que lata)*/

select * from tabela_de_produtos ORDER BY embalagem desc, NOME_DO_PRODUTO asc;

/*Agrupando os resultados*/
select * from tabela_de_clientes;
select Estado, limite_de_credito from tabela_de_clientes;

select Estado, sum(limite_de_credito) AS LIMITE_TOTAL from tabela_de_clientes group by estado; /*TEM que colocar o AS, porque é um "campo novo".
A modificação temporária dos valores recebe um nome novo, por ser uma informação não explícita na tabela. */

select embalagem, preco_de_lista from tabela_de_produtos;
select embalagem, MAX(preco_de_lista) AS MAIOR_PRECO from tabela_de_produtos group by EMBALAGEM; /*Se não colocar o Group by, 
														aparecerá apenas a mais cara e não as mais caras de todos os tipos de embalagem */

select embalagem, count(*) AS CONTADOR from tabela_de_produtos group by EMBALAGEM; /*Mostra quantos ítens de cada tipo tem*/

select bairro, sum(limite_de_credito) AS CREDITO_TOTAL from tabela_de_clientes group by BAIRRO; /*Soma de crédito por bairro*/

select bairro, sum(limite_de_credito) AS CREDITO_TOTAL from tabela_de_clientes where cidade = 'Rio de Janeiro' group by BAIRRO; 
/*Soma de crédito dos bairros do Rio de Janeiro*/

select estado, bairro, sum(limite_de_credito) AS CREDITO_TOTAL from tabela_de_clientes group by Estado, BAIRRO; 

select estado, bairro, sum(limite_de_credito) AS CREDITO_TOTAL from tabela_de_clientes where cidade = 'Rio de Janeiro'
 group by Estado, BAIRRO; 

select estado, bairro, sum(limite_de_credito) AS CREDITO_TOTAL from tabela_de_clientes 
where cidade = 'Rio de Janeiro'
group by Estado, BAIRRO
order by bairro;

select estado, bairro, sum(limite_de_credito) AS CREDITO_TOTAL from tabela_de_clientes 
where cidade = 'Rio de Janeiro'
group by Estado, BAIRRO
order by bairro desc;

/*Usando a condição HAVING*/
select Estado, sum(limite_de_credito) AS SOMA_LIMITE from tabela_de_clientes
group by Estado;

select Estado, sum(limite_de_credito) AS SOMA_LIMITE from tabela_de_clientes
where SOMA_LIMITE >900000
group by Estado; /*Esse comando não funciona, pois o agrupamento é feito ANTES da verificação, entâo:*/

select Estado, sum(limite_de_credito) AS SOMA_LIMITE from tabela_de_clientes
group by Estado having sum(limite_de_credito) > 900000; 

select embalagem, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO 
from tabela_de_produtos
group by embalagem; /*Mostra o maior e menor preço por tipo de embalagem*/

select embalagem, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO 
from tabela_de_produtos
group by embalagem HAVING sum(PRECO_DE_LISTA) <=80;

select embalagem, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO 
from tabela_de_produtos
group by embalagem HAVING sum(PRECO_DE_LISTA) <=80 and MAX(PRECO_DE_LISTA) >=5;

/*Classificando resultados*/
select * from tabela_de_produtos;
select nome_do_produto, preco_de_lista,
CASE
	when preco_de_lista >= 12 then 'PRODUTO CARO'
    when preco_de_lista >= 7 then 'PRODUTO EM CONTA'
    else 'PRODUTO BARATO'
END AS STATUS_PRECO
FROM tabela_de_produtos;

select EMBALAGEM,
CASE
	when preco_de_lista >= 12 then 'PRODUTO CARO'
    when preco_de_lista >= 7 then 'PRODUTO EM CONTA'
    else 'PRODUTO BARATO'
END AS STATUS_PRECO, avg(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
GROUP BY embalagem,
CASE
	when preco_de_lista >= 12 then 'PRODUTO CARO'
    when preco_de_lista >= 7 then 'PRODUTO EM CONTA'
    else 'PRODUTO BARATO'
END;

select EMBALAGEM,
CASE
	when preco_de_lista >= 12 then 'PRODUTO CARO'
    when preco_de_lista >= 7 then 'PRODUTO EM CONTA'
    else 'PRODUTO BARATO'
END AS STATUS_PRECO, avg(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
GROUP BY embalagem,
CASE
	when preco_de_lista >= 12 then 'PRODUTO CARO'
    when preco_de_lista >= 7 then 'PRODUTO EM CONTA'
    else 'PRODUTO BARATO'
END
ORDER BY EMBALAGEM;

select EMBALAGEM,
CASE
	when preco_de_lista >= 12 then 'PRODUTO CARO'
    when preco_de_lista >= 7 then 'PRODUTO EM CONTA'
    else 'PRODUTO BARATO'
END AS STATUS_PRECO, avg(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
where sabor = 'manga'
GROUP BY embalagem,
CASE
	when preco_de_lista >= 12 then 'PRODUTO CARO'
    when preco_de_lista >= 7 then 'PRODUTO EM CONTA'
    else 'PRODUTO BARATO'
END
ORDER BY EMBALAGEM;