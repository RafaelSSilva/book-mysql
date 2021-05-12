#round() => Arredonda valores.
SELECT ROUND(n_valoprodu,1) FROM comprodu;

#format() => Não faz o arredondamento, mas faz a formatação dos valores.
SELECT FORMAT(n_valoprodu,10) FROM comprodu;

#truncate() => Trunca as casas decimais, ou seja, omiti-las.
SELECT TRUNCATE(MAX(n_totavenda), 0) Maior_Venda 
FROM comvenda;

SELECT TRUNCATE(MIN(n_totavenda), 0) Menor_Venda FROM comvenda; 

#sqrt() => raiz quadrada.
SELECT SQRT(4);

#Multipicação
SELECT (n_qtdeivenda * n_valoivenda) FROM comivenda;

#Divisão
SELECT TRUNCATE((SUM(n_valoivenda) / COUNT(n_numeivenda)),4) divisao FROM comivenda;

#Adição
SELECT (n_qtdeivenda + n_valoivenda) FROM comivenda;

#Subtração
SELECT (n_qtdeivenda - n_valoivenda) FROM comivenda;








