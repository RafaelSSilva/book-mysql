##Criando tabela comclien_bkp com a mesma estrutura de dados da tabela comclien.
create table comclien_bkp(
	select * from comclien where c_estaclien = 'SP'
);

create table comcontato(
	n_numecontato int primary key not null auto_increment,
	c_nomecontato varchar(200),
    c_fonecontato varchar(30),
	c_cidacontato varchar(200),
    c_estacontato varchar(2),
    n_numeclien	  int
);

##Inserindo registros da tabela comclien na comcontato
insert into comcontato(
	select n_numeclien,
		   c_nomeclien,
           c_foneclien, 
		   c_cidaclien,
		   c_estaclien,
           n_numeclien
	from comclien
);

##atualizando registros na tabela comcontato
update comcontato set c_cidacontato = 'Londrina', c_estacontato = 'PR'
	where n_numeclien in (select n_numeclien from comclien_bkp);

##Deletando da tabela de contatos, os clientes que não estiverem na tabela de vendas.alter
delete from comcontato where n_numeclien not in (select n_numeclien from comvenda); 
  
