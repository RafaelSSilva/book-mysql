DELIMITER $$

CREATE PROCEDURE processa_comissionamento(
	IN  data_inicial 		DATE,
    IN  data_final			DATE,
    OUT total_processado	INT)
	BEGIN
		
        DECLARE total_venda 	FLOAT(10, 2) DEFAULT 0;
		DECLARE venda			INT 		 DEFAULT 0;
        DECLARE vendedor		INT 		 DEFAULT 0;
        DECLARE comissao    	FLOAT(10, 2) DEFAULT 0;
		DECLARE valor_comissao  FLOAT(10, 2) DEFAULT 0;
        DECLARE aux         	INT          DEFAULT 0;
        DECLARE fimloop     	INT          DEFAULT 0;
	
    ## Cursor para buscar os registros a serem
    ## processados entre a data inicial e data final
    ## e valor total de venda é maior que zero
    DECLARE busca_pedido CURSOR FOR
		SELECT 
			n_numevenda, 
			n_totavenda,
            n_numevende
		FROM comvenda
        WHERE d_datavenda BETWEEN data_inicial AND data_final AND n_totavenda > 0;
        
	## Tratamento para o banco não executar o loop quando ele terminar evitando que retorne qualquer erro.
    DECLARE
    CONTINUE HANDLER 
    FOR SQLSTATE '02000'
	SET fimloop = 1;
    
    ##Abri cursor busca_pedido
    OPEN busca_pedido;
		
        ##Inicio o loop
        vendas: LOOP
        
        ##Verifica se o loop terminou e sai do loop.
        IF fimloop = 1 THEN
			LEAVE vendas;
		END IF;
		
        ##Recebo o resultado da consulta em cada variável.
        FETCH busca_pedido INTO venda, total_venda, vendedor;
		
        ##Busca o valor do porcentual de cada vendedor. 
        SELECT n_porcvende
			INTO comissao
            FROM comvende
            WHERE n_numevende = vendedor; 
            
		##Verifica se a comissão é > que zero.
        IF (comissao > 0) THEN
			## Calcula o valor da comissão.
            SET valor_comissao = ((total_venda * comissao) /100);
			
            ##update na tabela comvenda com o valor da comissão.
            UPDATE comvenda SET n_vcomvenda = valor_comissao
            WHERE n_numevenda = venda;
            COMMIT;
		##Verifica se o porcentual de vendedor é igual a zero.
        ELSEIF (comissao = 0) THEN
			UPDATE comvenda SET n_vcomvenda = 0
            WHERE n_numevenda = venda;
            COMMIT;
		##Se ele não possuir registro no porcentual de comissão ele irá ganhar 
        ## 1 de comissão. Isso pela regra de negócio do nosso sistema.
        ELSE
			SET comissao = 1;
            ## Calcula o valor da comissão.
            SET valor_comissao = ((total_venda * comissao) /100);
            
            ##update na tabela comvenda com o valor da comissão.
            UPDATE comvenda SET n_vcomvenda = 0
				WHERE n_numevenda = venda;
				COMMIT;
		##fecho o if
		END IF;
            
		SET comissao = 0;
		##Utilizo a variável aux para contar a quantidade.
		SET aux = aux +1;
            
	#Fecha o loop
	END LOOP vendas;
         
	##Atribuo o total de vendas para a variável de saida.
	SET total_processado = aux;
        
	##Fecha o cursor
	CLOSE busca_pedido;
        
	##retorna o total de vendas processadas.
	END$$

DELIMITER ;


##Comandos
SHOW procedure status; 
DROP PROCEDURE processa_comissionamento;
DROP PROCEDURE IF EXISTS processa_comissionamento;

##Executar a procedure
CALL processa_comissionamento('2015-01-01', '2021-12-31', @a);
SELECT @a;

