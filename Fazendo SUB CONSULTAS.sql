/*Podemos usar uma sub-consulta dentre de um consulta*/
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes WHERE BAIRRO 
IN ('Tijuca','Jardins','Copacabana','Santo Amaro');

SELECT * FROM tabela_de_clientes WHERE BAIRRO 
IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores); /*Essa seleção é a junção das duas acima! Faz assim, 
														porque essa sub-seleção pode mudar em algum momento (ter mais bairros), 
                                                        aí não precisaria escrever de novo*/

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM) X WHERE X.PRECO_MAXIMO >= 10;
