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
perfil varchar(13)
)Engine = InnoDB;



-- a linha abaixo faz a insercao da tabela usuario_sistema
insert into usuario_sistema(login,senha,perfil) values ('admin','admin','administrador');
insert into usuario_sistema(login,senha,perfil) values ('renan','132','diretor');
insert into usuario_sistema(login,senha,perfil) values ('Joao','vgas23','coordenador');
insert into usuario_sistema(login,senha,perfil) values ('Hagata','cross67','Colaborador');


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
insert into horario(hora_inicio,hora_fim) values ('20:00:00','22:00:00');


-- a linha abaixo cria a tabela turma
create table turma (
idturma int not null primary key auto_increment,
tipoturma enum('B1','B2','B3','I'),
atividades_realizadas text not null,
horario_aulas int,
foreign key (horario_aulas) references horario (idhorario)

)Engine = InnoDB;



-- a linha abaixo insere na tabela turma
insert into turma(tipoturma,atividades_realizadas,horario_aulas) values ('B1','ensinar tocar violao','1');
insert into turma(tipoturma,atividades_realizadas,horario_aulas) values ('B2','ensinar a dancar','2');
insert into turma(tipoturma,atividades_realizadas,horario_aulas) values ('B3','ensinar teatro','3');
insert into turma(tipoturma,atividades_realizadas,horario_aulas) values ('I','ensinar tocar violino','4');



-- a linha abaixo cria a tabela colaborador
create table colaborador(

idcolaborador int not null primary key auto_increment,
ano_de_ingresso date,
area_de_atuacao varchar(50),
turmaministradas int not null,
foreign key (turmaministradas) references turma(idturma)

)Engine = InnoDB;

-- Insercoes na tabela de colaboradores
insert into colaborador(ano_de_ingresso,area_de_atuacao,turmaministradas)
 values('2010-01-08','Professor de Ingles','1');

insert into colaborador(ano_de_ingresso,area_de_atuacao,turmaministradas)
 values('2010-05-10','Instrutor de bateria','2'); 

insert into colaborador(ano_de_ingresso,area_de_atuacao,turmaministradas)
 values ('2005-08-20','Professor de Alemao','3');

insert into colaborador(ano_de_ingresso,area_de_atuacao,turmaministradas)
 values ('2012-10-3','Instrutor de violao','4');


-- a linha abaixo cria a tabela turno
create table turno(
idturno int not null primary key auto_increment,
turnoo enum('M','V','N')

)Engine = InnoDB;

-- a linha abaixo faz a insercao dos turnos
-- a linha abaixo faz a inserÃƒÂ§ÃƒÂ£o dos turnos
insert into turno (turnoo) values ('M');
insert into turno (turnoo) values ('V');
insert into turno (turnoo) values('N');


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
religiao varchar(45),
ende_local int,
foreign key (ende_local) references endereco(idend)

)Engine = InnoDB;


-- Insert da tabela usuario
insert into usuario(nome,sexo,data_nascimento,naturalidade,nacionalidade,escola,rendafamiliar,email,profissao,raca,religiao)
values('Harrison Flores','M','1994-04-24','Corumbaense','Brasileiro','E','1000.00','mitchellB@hotmail.com','Mecanico','Parda','Catolica');

insert into usuario(nome,sexo,data_nascimento,naturalidade,nacionalidade,escola,rendafamiliar,email,raca,religiao)
values('Bianca Arrua','F','1998-05-25','Corumbaense','Brasileira','M','1200.00','Biancaa@hotmail.com','Branca','Catolica');

insert into usuario(nome,sexo,data_nascimento,naturalidade,nacionalidade,escola,rendafamiliar,email,profissao,raca,religiao)
values('Edwin Santos','M','1990-02-28','Corumbaense','Brasileiro','P','1800.00','EdwinE@hotmail.com','Office Boy','Preto','Catolica');

insert into usuario(nome,sexo,data_nascimento,naturalidade,nacionalidade,escola,rendafamiliar,email,raca,religiao)
values('Christiane Chales','F','1995-05-15','Corumbaense','Brasileira','E','1000.00','ChrisBH@hotmail.com','Parda','Catolica');

-- Inserindo na tabela Usuario;
update usuario set ende_local ='1' where idusu ='1';
update usuario set ende_local ='2' where idusu ='2';
update usuario set ende_local ='3' where idusu ='3';
update usuario set ende_local ='4' where idusu ='4';

-- a linha abaixo adiciona a tabela endereco
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

-- insere dados na tabela endereco
insert into endereco (unidade_federativa,municipio,bairro,rua,complemento,num_da_residencia,pais) values ('MS','corumba','maria leite','maria coelho','perto do san diego','240R','Brasil');
insert into endereco (unidade_federativa,municipio,bairro,rua,complemento,num_da_residencia,pais) values ('MS','ladario','cohab','acerola','centro','320P',default);
insert into endereco (unidade_federativa,municipio,bairro,rua,complemento,num_da_residencia,pais) values ('RJ','rio de janeiro','botafogo','mineral','centro','280P',default);
insert into endereco (unidade_federativa,municipio,bairro,rua,complemento,num_da_residencia,pais) values ('RJ','rio de janeiro','agencia','sao judas tadeu','centro','498P',default);


-- a linha abaixo cria a tabela pais(mae,pai)
create table pais (
idpais int not null primary key auto_increment,
nome_pai varchar(45),
nome_mae varchar(45)

)Engine = InnoDB;

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
insert into ocorrencias(advertencia,data_ocorencia,motivo) values('G','2018-05-15','agrediu o professor');
insert into ocorrencias(advertencia,data_ocorencia,motivo) values('M','2018-06-09','briga com alunos');
insert into ocorrencias(advertencia,data_ocorencia,motivo) values('L','2018-04-25','bagunca em sala');

-- Criando o campo Id_parti para tabela Participantes
alter table ocorrencias add column id_parti int;

-- Ligando Ocorrencias com a tabela Participantes  
alter table ocorrencias add foreign key (id_parti) references participantes(idparticipantes);

-- Inserindo na tabela Ocorrencias
update ocorrencias set id_parti = '1' where idocorrencias = '1';
update ocorrencias set id_parti = '2' where idocorrencias = '2';
update ocorrencias set id_parti = '3' where idocorrencias = '3';

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
insert into frequencia (presenca,justificar_falta) values ('F','fui ao medico');
insert into frequencia (presenca,justificar_falta) values ('F','onibus quebrou');



-- a linha abaixo cria a tabela participantes
create table participantes(
idparticipantes int not null primary key auto_increment,
status_Participante ENUM('D','M','N_M'),
serie varchar(45),
tipo_de_transporte varchar(45),
advertencia text,
desempenho varchar(45),
beneficio_social varchar(50),
ano_de_entrada date,
freq_part int,
idficha INT,
idusuario INT,
foreign key (idficha) references ficha_de_avaliacao(id_ficha_avaliacao),
foreign key (idusuario) references usuario(idusu),
foreign key (freq_part) references frequencia(idfrequencia)

)Engine = InnoDB;

-- Insert na tabela Participantes
insert into participantes(status_Participante ,serie,tipo_de_transporte,desempenho,beneficio_social ,ano_de_entrada,idficha,idusuario,freq_part) 
values('D','Quinto Ano','Bicicleta','Otimo','Nenhum','2014-02-15','1','1','1');

insert into participantes(status_Participante ,serie,tipo_de_transporte,desempenho,beneficio_social ,ano_de_entrada,idficha,idusuario,freq_part) 
values('M','S�timo Ano','Onibus','Regular','Bolsa Familia','2013-10-23','2','2','2');

insert into participantes(status_Participante ,serie,tipo_de_transporte,desempenho,beneficio_social ,ano_de_entrada,idficha,idusuario,freq_part)  
values('D','Oitavo Ano','Nao ha','Bom','Nenhum','2012-11-11','3','3','3');

insert into participantes(status_Participante ,serie,tipo_de_transporte,desempenho,beneficio_social ,ano_de_entrada,idficha,idusuario) 
values('M','Quarto Ano','Onibus','Ruim','Bolsa Familia','2017-07-17','4','4');


insert into participantes(status_Participante ,serie,tipo_de_transporte,desempenho,beneficio_social ,ano_de_entrada) 
values('M','8A','Onibus','bom','bolsa escola','2018-02-13');

insert into participantes(status_Participante ,serie,tipo_de_transporte,desempenho,beneficio_social ,ano_de_entrada) 
values('D','9A','Trem','regular','bolsa cultura','2018-05-20');

insert into participantes(status_Participante ,serie,tipo_de_transporte,desempenho,beneficio_social ,ano_de_entrada) 
values('N_M','6A','Onibus','ruim','bolsa estudantil','2018-08-09');

insert into participantes(status_Participante ,serie,tipo_de_transporte,desempenho,beneficio_social ,ano_de_entrada,idficha,idusuario,freq_part) 
values('M','Quinto Ano','Bicicleta','Otimo','Nenhum','2014-02-15','2','2','4');

-- Inserindo usuario na tabela Participantes;
update participantes set idusuario = '1' where idparticipantes = '1';
update participantes set idusuario = '2' where idparticipantes = '2';
update participantes set idusuario = '3' where idparticipantes = '3';
update participantes set idusuario = '4' where idparticipantes = '4';

-- Inserindo frequencia na tabela Participantes;
update participantes set freq_part = '1' where idparticipantes = '1';
update participantes set freq_part = '2' where idparticipantes = '2';
update participantes set freq_part = '3' where idparticipantes = '3';
update participantes set freq_part = '4' where idparticipantes = '4';

-- Inserindo ficha de avaliacao na tabela Participantes;
update participantes set idficha = '1' where idparticipantes = '1';
update participantes set idficha = '2' where idparticipantes = '2';
update participantes set idficha = '3' where idparticipantes = '3';
update participantes set idficha = '4' where idparticipantes = '4';


-- a linha abaixo cria a tabela eventos
create table eventos (
idevento int not null primary key auto_increment,
nome varchar(45),
tipo_evento enum('A','C','R'),
descricao text,
dataeven date,
colaborador_responsavel int not null,
foreign key (colaborador_responsavel) references colaborador(idcolaborador)

)Engine = InnoDB;

-- Fazendo inser��es na tabela eventos
insert into eventos(nome,tipo_evento,descricao,dataeven,colaborador_responsavel) 
values('Festa Junina Cultural','A','Festa Junina que ser� realizada pelo pessoal do Moinho Cultural, no Porto Geral','2018-06-18','2');

insert into eventos(nome,tipo_evento,descricao,dataeven,colaborador_responsavel) 
values('Moinho Inconcert','R','Concerto Musical realizado por todos os participantes do Moinho Cultural','2018-04-29','4');

-- Criando o campo Parti_cipantes na tabela eventos
alter table eventos add column parti_cipantes int;

-- Ligando eventos com Participantes
alter table eventos add foreign key (parti_cipantes) references participantes(idparticipantes);
-- Inserindo na tabela Eventos
update eventos set parti_cipantes = '1' where idevento = '1';
update eventos set parti_cipantes = '2' where idevento = '2';

select u.nome as 'Participante',f.Selecionado from participantes as p inner join ficha_de_avaliacao f on
 p.idficha=f.id_ficha_avaliacao inner join usuario u on p.idusuario=u.idusu where f.Selecionado='N';
update ficha_de_avaliacao set Selecionado = 'S' where id_ficha_avaliacao = '1'; 
update ficha_de_avaliacao set Selecionado = 'S' where id_ficha_avaliacao = '4'; 

select horario.hora_inicio as 'Inicio',horario.hora_fim as 'Fim',turma.atividades_realizadas as 'Atividades Realizadas', 
eventos.nome as 'Evento' from turma inner join horario on turma.horario_aulas=horario.idhorario inner join colaborador 
on colaborador.turmaministradas = turma.idturma inner join eventos on
 eventos.colaborador_responsavel=colaborador.idcolaborador;


select frequencia.presenca,count(frequencia.presenca) as 'Quantidade de Faltas',usuario.nome as 'Nome' from participantes
inner join usuario on participantes.idusuario=usuario.idusu inner join frequencia on 
participantes.freq_part=frequencia.idfrequencia group by frequencia.presenca,usuario.nome 
having frequencia.presenca = 'F' ;

select usuario.nome,usuario.sexo,usuario.data_nascimento as 'Data de Nascimento',usuario.naturalidade,endereco.unidade_federativa 'Unidade Federativa',usuario.rendafamiliar, participantes.desempenho,
frequencia.presenca, participantes.status_Participante 'Status do Participante',eventos.nome as 'Nome do Evento',eventos.tipo_evento as 'Tipo de Evento',ocorrencias.motivo from participantes 
inner join usuario on participantes.idusuario = usuario.idusu inner join endereco on endereco.idend = usuario.ende_local 
join ocorrencias on participantes.idparticipantes = ocorrencias.id_parti join eventos on participantes.idparticipantes = eventos.parti_cipantes inner join frequencia on frequencia.idfrequencia = participantes.freq_part 
group by usuario.data_nascimento,eventos.nome;
