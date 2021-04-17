create database bootcamp;
 create table aluno(
 id_aluno int primary key auto_increment,
 email varchar(30),
 nome varchar(100),
 idade smallint(3));


create table avaliacao(
id_avaliacao int primary key auto_increment,
titulo varchar(100),
descrição varchar(255),
id_aluno int,
CONSTRAINT fk_aluAval foreign key (id_aluno) references aluno (id_aluno)
);

select * from aluno
inner join avaliacao;
