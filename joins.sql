##Sintaxe "Formal"
##Consultar os campos código do cliente, nome razão e codido de venda das tabelas de clientes e vendas
select c_codiclien Codigo_Cliente, c_razaclien Nome_Cliente, c_codivenda Codigo_Venda 
	from comclien, comvenda
    where comclien.n_numeclien = comvenda.n_numevenda; 

##INNER JOIN
##Consulta o nome, nome razão e data venda das tabelas de clientes e vendas
select c_nomeclien as nome_cliente, c_razaclien as nome_razao, d_datavenda as data_venda from comclien
inner join comvenda
on comclien.n_numeclien = comvenda.n_numeclien;

describe comvenda;


