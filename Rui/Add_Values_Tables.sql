use bd_g7_sql;

INSERT INTO `bd_g7_sql`.`reuniao`
(`cod_reuniao`,
`data_reuniao`,
`assunto_reuniao`)
VALUES
("R001", "2020-06-15 17:30:00", "bullying"),
("R002", "2020-06-15 18:30:00", "requerimento"),
("R003", "2020-05-16 17:30:00", "bolsas de estudo"),
("R004", "2019-04-22 17:30:00", "bolsas de estudo");

INSERT INTO `bd_g7_sql`.`assistente_social`
(`cod_assistente_soc`,
`nome_assistente_soc`,
`cod_reuniao`)
VALUES
("AS01", "Filomena Silvestre", "R001"),
("AS02", "Laura Brito", "R002"),
("AS03", "Marcia Mendez", "R003");


INSERT INTO `bd_g7_sql`.`aluno`
(`cod_aluno`,
`nome_aluno`,
`curso`,
`turma`,
`num_aluno`,
`cod_assistente_soc`)
VALUES
("A001", "Rui Vitorino", "CRSI", "1L", '8190479', "AS01"),
("A002", "Luis Miguel", "CRSI", "1L", '8190448', "AS01"), #AS01
("A003", "Jorge Ficticio", "MRKT", "2A", '8190230', "AS02"),
("A004", "Susana Marquez", "GEST", "1F", '8190589', "AS03");

INSERT INTO `bd_g7_sql`.`diretor_turma`
(`cod_diretor_turma`,
`nome_diretor_turma`,
`turma_responsavel`,
`cod_aluno`)
VALUES
("DT01", "Altino Sampaio", "CRSI", "A001"), #e A002
("DT02", "Nuno Alves", "MRKT", "A002"),
("DT03", "Altino Sampaio", "GEST", "A003");

INSERT INTO `bd_g7_sql`.`processo`
(`cod_processo`,
`tipo_processo`,
`assunto_processo`,
`estado_processo`,
`cod_aluno`)
VALUES
("P001", "normal", "requerimento", "aberto", "A001"),
("P002", "normal", "bolsa de estudo", "aberto", "A002"),
("P003", "especial", "documentacao em falta", "encerrado", "A003"),
("P004", "especial", "bullying", "arquivado", "A004");

INSERT INTO `bd_g7_sql`.`servico`
(`cod_servico`,
`tipo_servico`,
`cod_processo`)
VALUES
("S01", "transferencia monetaria", "P001"),
("S02", "acompanhamento psicologico", "P002"),
("S03", "requerimento presidencia", "P003");

INSERT INTO `bd_g7_sql`.`contacto_aluno`
(`cod_contacto_aluno`,
`nome_contacto_aluno`,
`telf_contacto_aluno`,
`cod_aluno`)
VALUES
("CA001", "Luisa Vitorino", "911000479", "A001"),
("CA002", "Joana Miguel", "911000448", "A002"),
("CA003", "Joaquim Ficticio", "911000123", "A003"),
("CA004", "Pedro Marquez", "911000312", "A004");

INSERT INTO `bd_g7_sql`.`entidade_contacto`
(`cod_entidade`,
`nome_entidade`,
`tipo_entidade`,
`contacto_entidade`,
`cod_reuniao`)
VALUES
("E001", "PJ", "Externa", "911000111", "R001"),
("E002", "SS", "Externa", "911000222", "R002"),
("E003", "IPP", "Interna", "911000333", "R003"),
("E004", "SAS", "Interna", "911000444", "R004");