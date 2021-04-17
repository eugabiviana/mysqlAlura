/*DROP TABLE tbtabela_de_vendedores2;*/

insert into tbvendedores(
MATRICULA,
NOME,
PERCENTUAL_COMISSAO) VALUES('00233', 'João Geraldo da Fonseca', 0.10);

insert into tbvendedores(
MATRICULA,
NOME,
PERCENTUAL_COMISSAO) VALUES('00235', 'Márcio Almeida Silva', 0.08);

insert into tbvendedores(
MATRICULA,
NOME,
PERCENTUAL_COMISSAO) VALUES('00236', 'Cláudia Morais', 0.08);

update tbvendedores set PERCENTUAL_COMISSAO = 0.11 
where MATRICULA = '00236';

update tbvendedores set NOME = 'José Geraldo da Fonseca Junior' 
where MATRICULA = '00233';

select * from tbvendedores;



