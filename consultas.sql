##Seleciona todos os registros da tabela de clientes
SELECT * FROM comclien;

##Seleciona todos os registros da tabela clientes cujo o nome comece com a letra K
SELECT * FROM comclien WHERE c_nomeclien LIKE 'K%';

##Seleciona todos os registros da tabela clientes cujo o nome não comece com a letra K
SELECT * FROM comclien WHERE c_nomeclien NOT LIKE 'K%';

##seleciona todos os registros da tabela clientes cujo o nome come com qualquer caracterer e seja seguido da letra I. 
SELECT * FROM comclien WHERE c_nomeclien LIKE '_i%';

##seleciona todos os números dos clientes, tirando as repetições, que fizeram compras
SELECT DISTINCT n_numeclien FROM comvenda;

##seleciona o número e o nome dos clientes cujo o número seja 1 ou 2.
SELECT n_numeclien, c_nomeclien FROM comclien WHERE n_numeclien IN(1, 2);

##seleciona o número e o nome dos clientes cujo o número seja fiferente de 1 e 2
SELECT n_numeclien, c_nomeclien FROM comclien WHERE n_numeclien NOT IN(1,2);

##Seleciona os nomes dos clientes de maneira ordenada crescente.
SELECT c_nomeclien FROM comclien ORDER BY c_nomeclien ASC;

##Seleciona os nomes dos clientes de maneira ordenada descendente.
SELECT c_nomeclien FROM comclien ORDER BY c_nomeclien DESC;
