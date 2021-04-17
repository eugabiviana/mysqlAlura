use db_bootcamp;

insert into tb_aluno (NOME, EMAIL, IDADE) values ('João', 'joao@zup.com',30);
insert into tb_aluno (NOME, EMAIL, IDADE) values ('Ana', 'ana@zup.com',22);
insert into tb_aluno (NOME, EMAIL, IDADE) values ('Maria', 'maria@zup.com',87);
insert into tb_aluno (NOME, EMAIL, IDADE) values ('Fernando', 'fernando@zup.com',15);
insert into tb_aluno (NOME, EMAIL, IDADE) values ('João', 'joao@joao.com',30);
insert into tb_aluno (NOME, EMAIL, IDADE) values ('Ana', 'ana@ana.com',22);
insert into tb_aluno (NOME, EMAIL, IDADE) values ('Maria', 'maria@maria.com',87);
insert into tb_aluno (NOME, EMAIL, IDADE) values ('Fernando', 'fernando@fernando.com',15);


select * from tb_aluno;

delete from tb_aluno where EMAIL = 'joao@joao.com';

SELECT idade, nome FROM tb_aluno ORDER BY idade ASC;

select * from tb_aluno where EMAIL like '%zup%';
