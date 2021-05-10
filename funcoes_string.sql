#substr() e length()
SELECT c_codiprodu, c_descprodu FROM comprodu
WHERE SUBSTR(c_codiprodu,1,3) = '123' AND LENGTH(c_codiprodu) <= 6;

SELECT SUBSTR(c_razaclien,1,5) Razao_Social, LENGTH(c_codiclien) Tamanho_Cod FROM comclien
WHERE n_numeclien = 1;

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




