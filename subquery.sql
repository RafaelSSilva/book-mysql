##Consultar o nome razão dos clientes que estão na tabela de vendas
select c_razaclien from comclien 
	where n_numeclien in (select n_numeclien from comvenda);

##Consultar o nome razão dos clientes que não estão na tabela de vendas.
select c_razaclien from comclien where n_numeclien not in(select n_numeclien from comvenda);

##Consultar os códigos das vendas e o nome razão dos respectivos clientes.
select c_codivenda codigo_venda, 
	(select c_razaclien from comclien where comvenda.n_numeclien = n_numeclien) nome_razão 
		from comvenda;

