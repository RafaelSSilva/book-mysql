##Sintaxe "Formal"
select c_codiclien Codigo_Cliente, c_razaclien Nome_Cliente, c_codivenda Codigo_Venda 
	from comclien, comvenda
    where comclien.n_numeclien = comvenda.n_numevenda; 

##INNER JOIN
##Retorna rigistros quando houver pelo menos uma correspondência em ambas as tabelas.
select c_nomeclien as nome_cliente, c_razaclien as nome_razao, d_datavenda as data_venda 
	from comclien
	inner join comvenda
	on comclien.n_numeclien = comvenda.n_numeclien;

select c.c_nomeclien as clientes, c.c_razaclien as nome_razão, v.d_datavenda as datas
	from comclien as c
	inner join comvenda as v
	on c.n_numeclien = v.n_numevenda
	where c.c_nomeclien like 'i%';

select c.c_nomeclien as clientes, v.d_datavenda as dia, i.n_valoivenda as valor
	from comclien as c
	inner join comvenda as v
	on c.n_numeclien = v.n_numevenda
	inner join comivenda as i
	on i.n_numevenda = v.n_numevenda
	where i.n_valoivenda > 10;

##LEFT JOIN
##Retorna todos os registros da tabela à esquerda e os regitros em comum a tabela à direita.
select * from comclien as c
	left join comvenda as v
	on c.n_numeclien = v.n_numeclien;

##LEFT EXCLUDING JOIN
##Retorna todos os registros da tabela à esquerda e que não estejam na tabela à direita.
select * from comclien as c
	left join comvenda as v
	on c.n_numeclien = v.n_numeclien
	where v.n_numevenda is null;

##RIGHT JOIN
##Retorna todos os registros da tabela à direita e os registros em comum com a tabela à esquerda.
select * from comclien as c
	right join comvenda as v
	on c.n_numeclien = v.n_numeclien;

##RIGHT EXCLUDING JOIN
##Consulta os registros que estão na tabela à direita e que não estão à esquerda.
select * from comvenda as v
	right join comclien as c
    on c.n_numeclien = v.n_numeclien
    where v.n_numevenda is null;

##CROSS JOIN
##Retorna um produto cartesiano das tabelas, combina cada linha de uma tabela com todas as linhas de outra.
select * from comclien 
cross join comvenda;

##FULL JOIN
##Retorna todos os registros da tabela à esquerda e à direita
##select * from comclien as c
	##full outer join comvenda as v
    ##on c.n_numeclien = v.n_numeclien;














