CREATE DATABASE bd_g7_sql;
USE bd_g7_sql;

create table assistente_social (
	cod_assistente VARCHAR(25) not null,
    nome VARCHAR(45) not null,
    apelido VARCHAR(45) not null,
    telefone VARCHAR(25),
    constraint primary key (cod_assistente)
);

INSERT INTO `bd_g7_sql`.`assistente_social`
(`cod_assistente`, `nome`, `apelido`, `telefone`)
VALUES
	("AS01", "Filomena", "Silvestre", "915321654"),
    ("AS02", "Laura", "Brito", "952456258"),
    ("AS03", "Marcia", "Mendez", null);


create table reuniao (
	cod_reuniao VARCHAR(25) not null,
    assunto_reuniao VARCHAR (45),
    data_reuniao DATETIME not null,
    cod_assistente VARCHAR(25) not null,
    constraint primary key (cod_reuniao),
    constraint foreign key (cod_assistente) references assistente_social (cod_assistente)
);

INSERT INTO `bd_g7_sql`.`reuniao`
(`cod_reuniao`, `assunto_reuniao`, `data_reuniao`, `cod_assistente`)
VALUES
	("R001", "Bolsas de estudos", "2020-06-15 17:30:00", "AS01"),
    ("R002", "Assuntos externos", "2020-06-15 18:30:000", "AS02"),
    ("R003", "Requerimentos", "2020-05-16 17:30:00", "AS03"),
    ("R004", "Assuntos externos", "2020-04-22 17:30:00", "AS01");

create table entidade (
	cod_entidade VARCHAR(25) not null,
    nome_organizacao VARCHAR(45) not null,
    num_telefone VARCHAR(25),
    tipo_entidade VARCHAR(25),
    cod_reuniao VARCHAR(25) not null,
    constraint primary key (cod_entidade),
    constraint foreign key (cod_reuniao) references reuniao (cod_reuniao)
);

INSERT INTO `bd_g7_sql`.`entidade`
(`cod_entidade`, `nome_organizacao`, `num_telefone`, `tipo_entidade`, `cod_reuniao`)
VALUES
	("E001", "PSP", "Externa", "911000555", "R001"),
    ("E002", "PJ", "Externa", "911000999", "R002"),
    ("E003", "SS", "Interna", "911000777", "R003"),
    ("E004", "SAS", "Interna", "911000123", "R004");

create table processo (
	cod_processo VARCHAR(25) not null,
    tipo_processo VARCHAR(45) not null,
    descricao VARCHAR(45),
    estado VARCHAR(25) not null,
    constraint primary key (cod_processo)
);

INSERT INTO `bd_g7_sql`.`processo`
(`cod_processo`, `tipo_processo`, `descricao`, `estado`)
VALUES
	("P001", "Normal", "Requerimento", "Aberto"),
    ("P002", "Normal", "Bolsa de estudo", "Aberto"),
    ("P003", "Especial", "Documentacao em falta", "Encerrado"),
    ("P004", "Especial", "Bullying", "Arquivado");

create table aluno (
	cod_aluno VARCHAR(4) not null,
    num_aluno VARCHAR(9) not null,
    nome_aluno VARCHAR(45) not null,
    curso VARCHAR(45) not null,
    turma VARCHAR(45) not null,
    cod_assistente VARCHAR(25) not null,
    cod_processo VARCHAR(25) not null,
    constraint primary key (cod_aluno),
    constraint foreign key (cod_assistente) references assistente_social (cod_assistente),
    constraint foreign key (cod_processo) references processo (cod_processo)
);

INSERT INTO `bd_g7_sql`.`aluno`
(`cod_aluno`, `num_aluno`, `nome_aluno`, `curso`, `turma`, `cod_assistente`, `cod_processo`)
VALUES
	("A001", "8190479", "Rui Vitorino", "CRSI", "1L", "AS01", "P001"),
    ("A002", "8190448", "Luis Miguel", "CRSI", "1L", "AS02", "P002"),
    ("A003", "8190230", "Jorge Ficticio", "MRKT", "2A", "AS03", "P003"),
    ("A004", "8190589", "Susana Marquez", "GEST", "1F", "AS01", "P004");

create table contacto_aluno (
	cod_contacto VARCHAR(25) not null,
    nome VARCHAR(20) not null,
    apelido VARCHAR(20) not null,
    telefone VARCHAR(25),
    cod_aluno VARCHAR(4) not null,
    constraint primary key (cod_contacto),
    constraint foreign key (cod_aluno) references aluno (cod_aluno)
);

INSERT INTO `bd_g7_sql`.`contacto_aluno`
(`cod_contacto`, `nome`, `apelido`, `telefone`, `cod_aluno`)
VALUES
	("CA001", "Luisa", "Vitorino", "911000111", "A001"),
    ("CA002", "Joana", "Miguel", "911000222", "A002"),
    ("CA003", "Joaquim", "Ficticio", "911000333", "A003"),
    ("CA004", "Pedro", "Marquez", "911000444", "A002");

create table diretor_turma (
	cod_diretor VARCHAR(25) not null,
	nome_diretor VARCHAR(20) not null,
    turma VARCHAR(10) not null,
    cod_aluno VARCHAR(4) not null,
    constraint primary key (cod_diretor),
    constraint foreign key (cod_aluno) references aluno (cod_aluno)
);

INSERT INTO `bd_g7_sql`.`diretor_turma`
(`cod_diretor`, `nome_diretor`, `turma`, `cod_aluno`)
VALUES
	("DT01", "Altino Sampaio", "CRSI", "A001"),
	("DT02", "Altino Sampaio", "CRSI", "A002"),
	("DT03", "Nuno Alves", "MRKT", "A002"),
	("DT04", "Altino Sampaio", "GEST", "A003");

create table servico (
	cod_servico VARCHAR(25) not null, 
    tipo_servico VARCHAR(45) not null,
    cod_processo VARCHAR(25) not null,
    constraint primary key (cod_servico),
    constraint foreign key (cod_processo) references processo (cod_processo)
);

INSERT INTO `bd_g7_sql`.`servico`
(`cod_servico`, `tipo_servico`, `cod_processo`)
VALUES
	("S01", "transferencia monetaria", "P001"),
	("S02", "acompanhamento psicologico", "P002"),
	("S03", "doacoes", "P003");
