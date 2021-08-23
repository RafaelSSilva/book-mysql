#SUBSTR() => Extrai uma substring de uma string (Começando em qualquer posição).
#SUBSTR(string, start, length) ou SUBSTR(string from start for length)
#Parâmetros:
# string: Obrigatório. String para extração
#  start:  Obrigatório. Pode ser número positivo ou negativo. Se for positico, a função extrai do início da string. Se for negativo,
# a função extrai do final da string.
#  length: Opcional.Número de caracteres a serem extraidos. Se omitido, tada a string será retornada(da posição inicial).

SELECT SUBSTR('The number of characters to extract. If omitted', 5, 6) AS substring;
SELECT SUBSTR('The number of characters to extract. If omitted', -7,7) AS SUBSTRING; 

#substr() e length()
SELECT c_codiprodu, c_descprodu FROM comprodu
WHERE SUBSTR(c_codiprodu,1,3) = '123' AND LENGTH(c_codiprodu) <= 6;

SELECT SUBSTR(c_razaclien,1,5) Razao_Social, LENGTH(c_codiclien) Tamanho_Cod FROM comclien
WHERE n_numeclien = 1;

#SUBSTRING_INDEX => Extrai uma substring de uma string antes que um número especificado de delimitador ocorra.
#SUBSTRING_INDEX(string, delimiter, number)
#Parâmetros:
#string: Obrigatório. A string a ser extraida.
#delimiter: Obrigatório. O delimitador a ser pesquisado.
#number: Obrigatório. O número de vezes para pesqusisar o delimitador. Pode ser um número positivo ou negativo. Se for um número positivo, esta função
# retorna tudo à esquerda do delimitador. Se for um número negativo, esta função retorna tudo à direita do delimitador.

SELECT SUBSTRING_INDEX("www.w3schools.com", ".", 2);

#concat()
SELECT CONCAT(c_codiclien, ' ', c_razaclien ,' ', c_nomeclien) FROM comclien
WHERE c_razaclien LIKE 'Kik%';

#concat_WS()
SELECT CONCAT_WS(';',c_codiclien, c_razaclien, c_nomeclien) 
FROM comclien
WHERE c_razaclien LIKE 'Kik%';

#lcase -> Letras minúsculas
SELECT LCASE(c_razaclien) FROM comclien;

#ucase - Letras maiúsculas
SELECT UCASE(c_razaclien) FROM comclien;

#LOCATE() => Retorna a posição da primeira ocorrência de uma substring em uma string. Retorna zero caso a substring não seja encontrada.
#não diferencia maiúsculas de minúsculas.
#LOCATE(substring, string)
#Parâmetros:
#substring: Obrigatório. A substring a ser pesquisada.
#string: Obrigatório. A string que será pesquisada.
#start: Opcional. Posição inicial para a pesquisa. Posição 1 é o padrão.

SELECT LOCATE("com", "W3Schools.com") AS posicao


