use bd_g7_sql;

/*create view ent_externas as
select * from entidade_contacto
where tipo_entidade="Externa";


create view ano_2020_reuniao as
select data_reuniao from reuniao
where data_reuniao like "2020%";

create view ano_201X_reuniao as
select data_reuniao from reuniao
where data_reuniao like "201%";

#create view processos_externos as
#select processo.cod_processo, entidade_contacto.nome_entidade
#from processo
#ano_2020_reuniaoinner join entidade_contacto on processo.cod_entidade=entidade_contacto.cod_entidadeprocessos_externos*/
create view alunos_crsi as
select * from aluno
where curso="CRSI";
