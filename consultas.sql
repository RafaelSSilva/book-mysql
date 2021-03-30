##Seleciona todos os registros da tabela de clientes
select * from comclien;

##Seleciona todos os registros da tabela clientes cujo o nome comece com a letra K
select * from comclien where c_nomeclien like 'K%';

##Seleciona todos os registros da tabela clientes cujo o nome não comece com a letra K
select * from comclien where c_nomeclien not like 'K%';

##seleciona todos os registros da tabela clientes cujo o nome come com qualquer caracterer e seja seguido da letra I. 
select * from comclien where c_nomeclien like '_i%';

##seleciona todos os números dos clientes, tirando as repetições, que fizeram compras
select distinct n_numeclien from comvenda;

##seleciona o número e o nome dos clientes cujo o número seja 1 ou 2.
select n_numeclien, c_nomeclien from comclien where n_numeclien in(1, 2);

##seleciona o número e o nome dos clientes cujo o número seja fiferente de 1 e 2
select n_numeclien, c_nomeclien from comclien where n_numeclien not in(1,2);