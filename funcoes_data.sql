/*Formatos de Datas
	USA (YYYY-MM-DD)
    EUR (DD.MM.YYYY)
*/

#curdate() => Retorna a data atual.
SELECT CURDATE();

#now() => Retorna a data e o horário atual.
SELECT NOW();

#sysdate() => Retorna a data e o horário atual.
SELECT SYSDATE();

#curtime() => Retorna somente o horário atual.
SELECT CURTIME();

#datediff() => Retorna o intervalo entre duas datas.
SELECT DATEDIFF(CURDATE(), '2021-05-05 14:30:00');

#date_add() => Adiciona dias a uma data.
SELECT DATE_ADD(CURDATE(), interval 10 day);

#dayname() => Retorna o nome do dia da semana.
SELECT DAYNAME(CURDATE());

#dayofmonth() => Retorna o dia do mês.
SELECT DAYOFMONTH(CURDATE());

#extract() => Extrair o ano de uma data.alter
SELECT EXTRACT(YEAR FROM CURDATE());

#last_day() =>Extrair o último dia do mês
SELECT LAST_DAY(CURDATE());

#formatando datas
SELECT DATE_FORMAT(CURDATE(), GET_FORMAT(date, 'EUR'));

#Converter texto para data
SELECT STR_TO_DATE('August 10 2021','%M %d %Y');