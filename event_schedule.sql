
/*
	Periodicidades:
		on schedule every 1 month: uma vez por mês.
		on schedule every 1 day: uma vez por dia.
        on schedule every 1 hour: uma vez por hora.
		on schedule every 1 minute: uma vez por minuto.
        on schedule every 1 second: uma vez por segundo.
*/

SET GLOBAL EVENT_SCHEDULE = ON;

##EVENT SCHEDULE agendado para executar a procedure 'processa_comissionamento' uma vez por semana.
DELIMITER $$

CREATE EVENT processa_comissao_event
	ON SCHEDULE EVERY 1 WEEK STARTS '2021-05-19 23:38:00'
    DO
		BEGIN
			CALL processa_comissionamento(
				CURRENT_DATE() - INTERVAL 7 DAY,
                CURRENT_DATE(),
                @a);
			END
 $$
 
 DELIMITER ;
 
 ##EVENT SCHEDULE agendado para executar a procedure 'processa_comissionamento' a cada 10 minutos e parar 
 ##depois de uma hora.
 DELIMITER $$
	CREATE EVENT processa_comissao
		ON SCHEDULE EVERY 10 MINUTE
        STARTS CURRENT_TIMESTAMP 
        ENDS CURRENT_TIMESTAMP + INTERVAL 30 MINUTE
        DO
			BEGIN
				CALL processa_comissionamento(
					current_date() - interval 7 day,
                    current_date(),
                    @a
				);
		END
    $$
 DELIMITER ;
 
 #Desabilitar e habilitar os eventos
 ALTER EVENT processa_comissao DISABLE;
 ALTER EVENT processa_comissao_event DISABLE;
 
 ALTER EVENT processa_comissao ENABLE;
 ALTER EVENT processa_comissao_event ENABLE;
 
 