use comercial;

## Criação das Tabelas

## Tabela Clientes
create table comclien(
	n_numeclien int not null auto_increment,
    c_codiclien varchar(10),
    c_nomeclien varchar(100),
    c_razaclien varchar(100),
	d_dataclien date,
	c_cnpjclien varchar(20),
    c_foneclien varchar(20),
    
    primary key(n_numeclien)
);

##Tabela Fornecedores 
create table comforne(
	n_numeforne int not null auto_increment,
    c_codiforne varchar(10),
    c_nomeforne varchar(100),
    c_razaforne varchar(100),
    c_foneforne varchar(20),
    
    primary key(n_numeforne)
);

##Tabela Vendedores
create table comvende(
	n_numevende int not null auto_increment,
	c_codivende varchar(10),
    c_nomevende varchar(100),
    c_razavende varchar(100),
    c_fonevende varchar(20),
	n_porcvende float(10,2),
	
    primary key(n_numevende)
);

##Tabela Produtos
create table comprodu(
	n_numeprodu int not null auto_increment,
    c_codiprodu varchar(20),
	c_descprodu varchar(100),
	n_valoprodu float(10, 2),
    c_situprodu varchar(1),
    n_numeforne int,
    
    primary key(n_numeprodu)
);

##Tabela Vendas
create table comvenda(
	n_numevenda int not null auto_increment,
    c_codivenda varchar(10),
    n_valovenda float(10, 2),
    n_descvenda float(10,2),
    n_totavenda float(10, 2),
    d_datavenda date,
    
    n_numeclien int not null,
    n_numeforne int not null,
    n_numevende int not null,
    
    primary key(n_numevenda)
);

create table comvendas(
	n_numevenda int not null auto_increment,
    c_codivenda varchar(10),
    n_numeclien int not null,
    n_numeforme int not null,
    n_numevende int not null,
    n_valovenda float(10, 2),
    n_descvenda float(10, 2),
    n_totavenda float(10, 2),
    d_datavenda date,
    
    primary key(n_numevenda)
);

##Tabela Itens Vendas
create table comivenda(
	n_numeivenda int not null auto_increment,
    
    n_valoivenda float(10, 2),
    n_qtdeivenda int,
    n_descivenda float(10,2),
    
    n_numevenda int not null,
    n_numeprodu int not null,
    
    primary key(n_numeivenda)
);

/*Criação de constraints foreign key*/
alter table comvenda add constraint fk_comvenda_comforne 
	foreign key(n_numeforne)  
		references comforne(n_numeforne)
			on delete no action
            on update no action;

alter table comvenda add constraint fk_comvenda_comvende
	foreign key(n_numevende)
		references comvende(n_numevende)
			on delete no action
            on update no action;

alter table comvenda add constraint fk_comvenda_comclien  
	foreign key(n_numeclien)
		references comclien(n_numeclien)
			on delete no action
            on update no action;

alter table comivenda add constraint fk_comivenda_comprodu
	foreign key(n_numeprodu)
		references comprodu(n_numeprodu)
			on delete no action
            on update no action;

alter table comivenda add constraint fk_comivenda_comvenda
	foreign key(n_numevenda)
		references comvenda(n_numevenda)
			on delete no action
            on update no action;
         
 /*Adicionando, removendo e alterando colunas*/        
 alter table comclien add column c_cidaclien varchar(100);
 
 alter table comclien add  column c_estclien varchar(100); 
 alter table comclien drop column c_estclien; 
 
 alter table comclien add column c_estaclien varchar(50);
 alter table comclien modify column c_estaclien varchar(100);
 
 ##remove tabela falsa.
 drop table comvendas;
 
 ##Adiciona coluna n_vcomvenda na tabela comvenda
 ALTER TABLE comvenda ADD n_vcomvenda FLOAT(10,2);
 

 
            












