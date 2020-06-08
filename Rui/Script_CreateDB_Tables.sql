create database bd_g7_sql;
use bd_g7_sql;

create table reuniao (
	cod_reuniao varchar(5) not null,
    data_reuniao datetime not null,
    assunto_reuniao varchar(45) not null,
    constraint primary key (cod_reuniao)
);

create table entidade_contacto (
	cod_entidade varchar(4) not null,
    nome_entidade varchar(3) not null,
    tipo_entidade varchar(7) not null,
    contacto_entidade int(9) not null,
    cod_reuniao varchar(5) not null,
	constraint primary key (cod_entidade),
    constraint foreign key (cod_reuniao) references reuniao(cod_reuniao)
);

create table assistente_social (
	cod_assistente_soc varchar(4) not null, #chave primaria
    nome_assistente_soc varchar(45),
    cod_reuniao varchar(4),
    constraint primary key (cod_assistente_soc),
    constraint foreign key (cod_reuniao) references reuniao(cod_reuniao)
);

create table aluno (
	cod_aluno varchar(4) not null, #chave primaria
    nome_aluno varchar(45) not null,
    curso varchar(4) not null,
    turma varchar(2) not null,
    num_aluno int(4) not null,
    cod_assistente_soc varchar(4) not null,
    constraint primary key (cod_aluno),
    constraint foreign key (cod_assistente_soc) references assistente_social(cod_assistente_soc)
);

ALTER TABLE aluno 
ADD CONSTRAINT aluno_fk_1
FOREIGN KEY (cod_assistente_soc) REFERENCES assistente_social(cod_assistente_soc);

create table processo (
	cod_processo varchar(5) not null,
    tipo_processo varchar(8) not null,
    assunto_processo varchar(45) not null,
    estado_processo varchar(15) not null,
    cod_aluno varchar(4) not null,
    constraint primary key (cod_processo),
    constraint foreign key (cod_aluno) references aluno(cod_aluno)
);

create table contacto_aluno (
	cod_contacto_aluno varchar(5) not null,
    nome_contacto_aluno varchar(45) not null,
    telf_contacto_aluno int(9) not null,
    cod_aluno varchar(4) not null,
	constraint primary key (cod_contacto_aluno),
    constraint foreign key (cod_aluno) references aluno(cod_aluno)
);

create table diretor_turma (
	cod_diretor_turma varchar(4) not null,
    nome_diretor_turma varchar(45) not null,
    turma_responsavel varchar(6) not null,
    cod_aluno varchar(4) not null,
	constraint primary key (cod_diretor_turma),
    constraint foreign key (cod_aluno) references aluno(cod_aluno)
);

create table servico (
	cod_servico varchar(4) not null,
    tipo_servico varchar(45) not null,
    cod_processo varchar(5) not null,
	constraint primary key (cod_servico),
    constraint foreign key (cod_processo) references processo(cod_processo)
);




