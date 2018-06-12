/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Harrison
 * Author:  Eduardo Montenegro
 * Author: Edwin Santos
 * Created: 06/06/2018
 */


-- a linha abaixo cria o banco de dados moinho
create database moinho;


-- a linha abaixo seleciona o banco de dados moinho
use moinho;

-- a linha abaixo cria a tabela usuario_sistema
create table usuario_sistema (
id int not null primary key auto_increment,
login varchar(45) not null,
senha varchar (8) not null,
perfil varchar(10)
)Engine = InnoDB;

-- aumenta o tamanho do campo perfil de 10 para 13
alter table usuario_sistema modify perfil varchar(13);

-- a linha abaixo faz a insercao da tabela usuario_sistema
insert into usuario_sistema(login,senha,perfil) values ('admin','admin','administrador');
insert into usuario_sistema(login,senha,perfil) values ('renan','132','diretor');
insert into usuario_sistema(login,senha,perfil) values ('Joao','vgas23','coordenador');
insert into usuario_sistema(login,senha,perfil) values ('Hagata','cross67','Colaborador');

-- a linha abaixo cria a tabela colaborador
create table colaborador(

idcolaborador int not null primary key auto_increment,
ano_de_ingresso date,
area_de_atuacao varchar(50)


)Engine = InnoDB;



-- adiciona um campo ao final da tabela colaborador
alter table colaborador add column turmaministradas int not null;

-- a linha abaixo cria uma chave estrangeira e faz referencia com a tabela turma
alter table colaborador add foreign key (turmaministradas) references turma(idturma);

-- Insercoes na tabela de colaboradores
insert into colaborador(ano_de_ingresso,area_de_atuacao,turmaministradas)
 values('2010-01-08','Professor de Ingles',1);

insert into colaborador(ano_de_ingresso,area_de_atuacao,turmaministradas)
 values('2010-05-10','Instrutor de bateria',2); 

insert into colaborador(ano_de_ingresso,area_de_atuacao,turmaministradas)
 values ('2005-08-20','Professor de Alemao',3);

insert into colaborador(ano_de_ingresso,area_de_atuacao,turmaministradas)
 values ('2012-10-3','Instrutor de violao',4);

-- a linha abaixo cria a tabela turno
create table turno(
idturno int not null primary key auto_increment,
turnoo enum('M','V','N')

)Engine = InnoDB;

-- a linha abaixo faz a inserÃƒÂ§ÃƒÂ£o dos turnos
insert into turno (turnoo) values ('M');
insert into turno (turnoo) values ('V');
insert into turno (turnoo) values('N');


-- a linha abaixo cria a tabela de horario
create table horario (
idhorario int not null primary key auto_increment,
hora_inicio time,
hora_fim time

)Engine = InnoDB;

-- Insercao na tabela horario
insert into horario(hora_inicio,hora_fim) values ('08:00:00','11:00:00');
insert into horario(hora_inicio,hora_fim) values ('14:00:00','17:00:00');
insert into horario(hora_inicio,hora_fim) values ('18:00:00','21:00:00');

-- a tabela abaixo cria a tabela cadastro_universal
create table cadastro_universal (
idcadastro int not null primary key auto_increment,
nome varchar(50),
data_nascimento date,
telefone varchar(15),
email varchar(40)

)Engine = InnoDB;

-- Inserts da tabela cadastro universal
insert into cadastro_universal(nome,data_nascimento,telefone,email) 
values('Agenor Pereira da Silva','1968-03-29','3232-5824','agen68@hotmail.com');

insert into cadastro_universal(nome,data_nascimento,telefone,email) 
values('Renan Moreira Andrade','1980-08-12','3234-7865','guerra45@hotmail.com');

insert into cadastro_universal(nome,data_nascimento,telefone,email) 
values('Joao Paulo Santos Cruz','1978-09-24','3233-3421','bando24@hotmail.com');

insert into cadastro_universal(nome,data_nascimento,telefone,email) 
values('Hagata Christianne de Souza','1985-04-22','3231-9420','agatinha@hotmail.com');



-- a linha abaixo cria a tabela ficha de avaliacao
create table ficha_de_avaliacao (
id_ficha_avaliacao int not null primary key auto_increment,
data_avaliacao timestamp default current_timestamp, -- gera automaticamente a data,
avaliacao_musical int(10),
danca int(10),
desenvoltura int(10),
tecnologia int(10)

)Engine = InnoDB;

-- Adicionando o campo Selecionado na tabela ficha_de_avaliacao
alter table ficha_de_avaliacao add column Selecionado enum('S','N');

-- Insercao na tabela Ficha de Avalicao
insert into ficha_de_avaliacao(avaliacao_musical,danca,desenvoltura,tecnologia,Selecionado) values ('3','2','4','1','N');
insert into ficha_de_avaliacao(avaliacao_musical,danca,desenvoltura,tecnologia,Selecionado) values ('4','3','4','5','S');
insert into ficha_de_avaliacao(avaliacao_musical,danca,desenvoltura,tecnologia,Selecionado) values ('5','3','2','4','S');
insert into ficha_de_avaliacao(avaliacao_musical,danca,desenvoltura,tecnologia,Selecionado) values ('1','3','2','3','N');

select * from ficha_de_avaliacao;

-- a linha abaixo cria a tabela usuario
create table usuario (

idusu int not null primary key auto_increment,
nome varchar(50),
sexo enum('M','F'),
data_nascimento date,
naturalidade varchar(45),
nacionalidade varchar(45),
escola enum('M','E','F','P'),
rendafamiliar decimal(6,2),
responsaveis text,
email varchar(45),
profissao varchar(45),
raca varchar(30),
religiao varchar(45)

)Engine = InnoDB;
-- Insert da tabela usuario
insert into usuario(nome,sexo,data_nascimento,naturalidade,nacionalidade,escola,rendafamiliar,email,profissao,raca,religiao)
values('Harrison Flores','M','1994-04-24','Corumbaense','Brasileiro','E',1000.00,'mitchellB@hotmail.com','Mecanico','Parda','Catolica');

insert into usuario(nome,sexo,data_nascimento,naturalidade,nacionalidade,escola,rendafamiliar,email,raca,religiao)
values('Bianca Arrua','F','1998-05-25','Corumbaense','Brasileira','M',1200.00,'Biancaa@hotmail.com','Branca','Catolica');

insert into usuario(nome,sexo,data_nascimento,naturalidade,nacionalidade,escola,rendafamiliar,email,profissao,raca,religiao)
values('Edwin Santos','M','1990-02-29','Corumbaense','Brasileiro','P',1800.00,'EdwinE@hotmail.com','Office Boy','Preto','Catolica');

insert into usuario(nome,sexo,data_nascimento,naturalidade,nacionalidade,escola,rendafamiliar,email,raca,religiao)
values('Christiane Chales','F','1995-05-15','Corumbaense','Brasileira','E',1000.00,'ChrisBH@hotmail.com','Parda','Catolica');

-- a linha abaixo cria uma tabela endereco
create table endereco (
idend int not null primary key auto_increment,
unidade_federativa varchar(45),
municipio varchar(45),
bairro varchar(45),
rua varchar(50),
complemento varchar(50),
num_da_residencia varchar(50),
pais varchar(45)  default 'Brasil'


)Engine = InnoDB;

-- inserts da tabela endereco
insert into endereco (unidade_federativa,municipio,bairro,rua,complemento,num_da_residencia,pais) values ('MS','corumba','maria leite','maria coelho','perto do san diego','240R','Brasil');
insert into endereco (unidade_federativa,municipio,bairro,rua,complemento,num_da_residencia,pais) values ('MS','ladario','cohab','acerola','centro','320P',default);
insert into endereco (unidade_federativa,municipio,bairro,rua,complemento,num_da_residencia,pais) values ('RJ','rio de janeiro','botafogo','mineral','centro','280P',default);
insert into endereco (unidade_federativa,municipio,bairro,rua,complemento,num_da_residencia,pais) values ('RJ','rio de janeiro','agencia','sao judas tadeu','centro','498P',default);

-- a linha abaixo cria a tabela pais(mae,pai)
create table pais (
idpais int not null primary key auto_increment,
nome varchar(45)

)Engine = InnoDB;


-- Alterando e adicionando um campo na tabela pais
alter table pais change column nome nome_pai varchar(45);
alter table pais add column nome_mae varchar(45);

-- Insercao na Tabela pais
insert into pais(nome_pai,nome_mae) values ('Andre de Lima e Silva','Ana Mirian Souza e Silva');
insert into pais(nome_pai,nome_mae) values ('Carlos Pasquim Drummond','Suellen Ribeiro Drummond');
insert into pais(nome_pai,nome_mae) values ('Marcos Paulo Andrada dos Santos','Elizabete Climaco dos Santos');
insert into pais(nome_pai,nome_mae) values ('Pedro Ronan de Godoy','Lilian Maria Salvador de Godoy');

-- a linha abaixo cria a tabela ocorrencias
create table ocorrencias (
idocorrencias int not null primary key auto_increment,
advertencia enum ('L','M','G'),
data_ocorencia date,
motivo text,
abuso text

)Engine = InnoDB;

-- está linha insere os valores na tabela ocorrencias
insert into ocorrencias(advertencia,data_ocorrencia,motivo,abuso) values('G','15/04/2018','agrediu o professor',' ');
insert into ocorrencias(advertencia,data_ocorrencia,motivo,abuso) values('M','05/07/2017','briga com alunos',' ');
insert into ocorrencias(advertencia,data_ocorrencia,motivo,abuso) values('L','26/09/2018','bagunca em sala',' ');


-- a linha abaixo cria a tabela turma
create table turma (
idturma int not null primary key auto_increment,
tipoturma enum('B1','B2','B3','I')

)Engine = InnoDB;

-- a linha abaixo insere na tabela turma
insert into turma(tipoturma) values ('B1');
insert into turma(tipoturma) values ('B2');
insert into turma(tipoturma) values ('B3');
insert into turma(tipoturma) values ('I');

-- a linha abaixo cria a tabela participantes
create table participantes(
idparticipantes int not null primary key auto_increment,
status_Participante ('D','M','N_M'),
serie varchar(45),
tipo_de_transporte varchar(45),
advertencia text,
desempenho varchar(45),
beneficio_social varchar(50),
ano_de_entrada date


)Engine = InnoDB;

-- a linha abaixo cria a tabela frequencia
create table frequencia(
idfrequencia int not null primary key auto_increment,
presenca enum ('F','P'),
data_aula timestamp default current_timestamp, -- gera automaticamente a data
justificar_falta text

)Engine = InnoDB;

-- inserção na tabela frequencia
insert into frequencia (presenca,justificar_falta) values ('F','estava doente');
insert into frequencia (presenca,justificar_falta) values ('P',null);




-- a linha abaixo cria a tabela eventos
create table eventos (
idevento int not null primary key auto_increment,
nome varchar(45),
tipo_evento enum('A','C','R'),
descricao text,
dataeven date


)Engine = InnoDB;

-- a linha abaixc cria um campo colaborador_responsavel dentro da table eventos
alter table eventos add column colaborador_responsavel int not null; 

-- a linha abaixo cria uma chave estrangeira e faz referencia com a tabela colaborador
alter table eventos add foreign key (colaborador_responsavel) references colaborador(idcolaborador);
