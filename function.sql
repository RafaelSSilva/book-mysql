DELIMITER $$

##Retorna o nome do cliente.
CREATE FUNCTION rt_nome_cliente(vn_numeclien INT)
	RETURNS VARCHAR(50) DETERMINISTIC
    
    BEGIN
		DECLARE nome VARCHAR(50);
        
        SELECT c_nomeclien INTO nome
			FROM comclien
		WHERE n_numeclien = vn_numeclien;
        
        RETURN nome;
	END $$
    
DELIMITER ;

##Testar
SELECT rt_nome_cliente(1);
SELECT c_codivenda, rt_nome_cliente(n_numeclien), d_datavenda FROM comvenda;
        
        