#GROUP BY 
SELECT c.c_codiclien, c.c_razaclien 
FROM comclien AS c
INNER JOIN comvenda AS v
ON c.n_numeclien = v.n_numeclien
GROUP BY c.c_codiclien, c.c_razaclien;

SELECT c.c_codiclien, c.c_razaclien, COUNT(v.n_numevenda) vendas 
FROM comclien AS c
INNER JOIN comvenda AS v
ON c.n_numeclien = v.n_numeclien
GROUP BY c.c_codiclien, c.c_razaclien;

#COUNT
SELECT COUNT(*) clientes from comclien;
SELECT COUNT(*) vendas from comvenda;
SELECT COUNT(*) produtos from comprodu;

#HAVING COUNT
SELECT c.c_codiclien, c.c_razaclien, COUNT(v.n_numevenda) vendas 
FROM comclien AS c
INNER JOIN comvenda AS v
ON c.n_numeclien = v.n_numeclien
GROUP BY c.c_codiclien, c.c_razaclien
HAVING COUNT(v.n_numevenda) > 1;

#MAX
SELECT MAX(n_totavenda) maior_venda FROM comvenda;

#MIN
SELECT MIN(n_totavenda) menor_venda FROM comvenda;

SELECT MIN(n_totavenda) menor , MAX(n_totavenda) maior FROM comvenda;

#SUM
SELECT SUM(n_totavenda) total_venda, SUM(n_valovenda) total_valor, SUM(n_descvenda) total_desconto FROM comvenda;

SELECT SUM(n_totavenda) total_venda, SUM(n_valovenda) total_valor, SUM(n_descvenda) total_desconto 
FROM comvenda WHERE d_datavenda BETWEEN '2015-01-01' AND '2021-05-06';

#AVG Média
SELECT FORMAT(AVG(n_totavenda), 2) FROM comvenda;


