## Consulta o percentual da comissão do cadastro de vendedores.
DELIMITER $$
CREATE FUNCTION rt_percentual_comissao(vn_n_numevende int)
RETURNS FLOAT DETERMINISTIC
BEGIN
	DECLARE percentual_comissao FLOAT(10, 2);
    
    SELECT n_porcvende INTO percentual_comissao
    FROM comvende
    WHERE n_numevende = vn_n_numevende;
    
    RETURN percentual_comissao;
    END;
$$
DELIMITER ;

#trigger before insert
DELIMITER $$
CREATE TRIGGER tri_vendas_bi
BEFORE INSERT ON comvenda
FOR EACH row

BEGIN 
	DECLARE percentual_comissao FLOAT(10,2);
	DECLARE valor_comissao FLOAT(10,2);
    
    ## Busca o percentual de comissão que o vendedor deve receber
    SELECT rt_percentual_comissao(NEW.n_numevende)
		INTO percentual_comissao;
        
	## Calculo da comissão
	SET valor_comissao = ((NEW.n_totavenda * percentual_comissao) / 100);

	##recebe o novo valor da comissão
    SET NEW.n_vcomvenda = valor_comissao;
    
    END
   $$
DELIMITER ;

#trigger before update
DELIMITER $$
CREATE TRIGGER tri_vendas_bu
BEFORE UPDATE ON comvenda
FOR EACH row

BEGIN
DECLARE percentual_comissao FLOAT(10,2);
DECLARE valor_comissao FLOAT(10,2);

	##Verifica se o valor anterior da venda e diferente do novo
	IF(OLD.n_totavenda <> NEW.n_totavenda) THEN
		SELECT rt_percentual_comissao(NEW.n_numevende) INTO percentual_comissao;
		
        ## Cálculo da comissão
        SET valor_comissao = ((NEW.n_totavenda * porcentual_comissao) / 100);
		SET NEW.n_vcomvenda = valor_comissao;
    END IF;
 END

$$
DELIMITER ;

#After insert
DELIMITER $$
CREATE TRIGGER tri_vendas_ai
AFTER INSERT ON comivenda
FOR EACH ROW
BEGIN
	#declaro as variáveis que utilizei
    DECLARE vtotal_itens FLOAT(10, 2) DEFAULT 0;
    DECLARE total_item   FLOAT(10, 2) DEFAULT 0;
    DECLARE fimLoop 	 BOOLEAN      DEFAULT FALSE;
    
    #Cursor para buscar os itens já registrados da venda
    DECLARE busca_itens CURSOR FOR
		SELECT n_valoivenda FROM comivenda
			WHERE n_numevenda = NEW.n_numevenda;
		
	#Handler para encerrar o loop antes da última linha.
    DECLARE CONTINUE HANDLER FOR
		sqlstate '02000'
		SET fimloop = true;
        
	#Abre o cursor
    OPEN busca_itens;
    
    #Declara o inicio do loop
    itens: LOOP
		FETCH busca_itens INTO total_item;

	#Encerra o bloco quando o cursor não retornar mais linhas.
		IF fimloop THEN
			LEAVE itens;
		END IF;
        
        #Somo o valor total de itens(produtos)
        SET vtotal_itens = vtotal_itens + total_item;
	END LOOP itens;
	
    CLOSE busca_itens;
    
    #atualizo o total na venda
    UPDATE comvenda SET n_totavenda = vtotal_itens
		WHERE n_numevenda = NEW.n_numevenda;
	END
 $$
DELIMITER ;
  
#after update
DELIMITER $$
CREATE TRIGGER tri_vendas_au
AFTER UPDATE ON comivenda
FOR EACH ROW
BEGIN
	#Declara variáveis
    DECLARE vtotal_itens FLOAT(10, 2) DEFAULT 0;
    DECLARE total_item   FLOAT(10, 2) DEFAULT 0;
	DECLARE fimloop BOOLEAN DEFAULT FALSE;
    
    #Cursor para buscar os itens ja registrados da venda
    DECLARE busca_itens CURSOR FOR
		SELECT n_valoivenda 
			FROM comivenda
			WHERE n_numevenda = NEW.n_numevenda;
  
	#Handler para encerrar o loop antes da última linha.
    DECLARE CONTINUE HANDLER FOR
		sqlstate '02000'
		SET fimloop = true;
	
    #Verifico se ha necessidade de alteraçãopen
    IF NEW.n_valoivenda <> OLD.n_valoivenda THEN
    
		#Abro cursor
        OPEN busca_itens;
         ##inicio do loop
         itens : loop
         
         FETCH busca_itens INTO total_item;
         
         #encerra o bloco quando o cursor não retornar mais 1 linhas.
         IF fimloop THEN
			LEAVE itens;
		END IF;
        
        # Somo o valor total dos itens(produtos)
        SET vtotal_itens = vtotal_itens + total_item;
	END LOOP itens;
    
    CLOSE busca_itens;
    
    #Atualizo o total da venda
    UPDATE comvenda SET n_totavenda = vtotal_itens
		WHERE n_nuevenda = NEW.n_numevenda;
  END IF;
  END
$$
DELIMITER ;

#After delete
DELIMITER $$
CREATE TRIGGER tri_ivendas_af
AFTER DELETE ON comivenda
FOR EACH ROW
BEGIN
	#Declara variáveis
    DECLARE vtotal_itens FLOAT(10, 2) DEFAULT 0;
    DECLARE total_item   FLOAT(10, 2) DEFAULT 0;
	DECLARE fimloop BOOLEAN DEFAULT FALSE;
    
    #Cursor para buscar os itens ja registrados na venda.
    DECLARE busca_itens CURSOR FOR
		SELECT n_valoivenda
			FROM comivenda
				WHERE n_numevenda = OLD.n_numevenda;
    
    #Handler para encerrar o loop antes da última linha.
    DECLARE CONTINUE HANDLER FOR
		sqlstate '02000'
		SET fimloop = true;
    
    #Abro o cursor
    OPEN busca_itens;
    
    #Declaro o inicio do loop
    itens: LOOP
		
        FETCH busca_itens INTO total_item;
        
        #Encerra o bloco quando o cursor não retornar mais linhas.
        IF fimloop THEN
			LEAVE itens;
		END IF;
        
        #Soma o valor total dos itens
        SET vtotal_itens = vtotal_itens + total_item;
		
        END LOOP itens;
        
        CLOSE busca_itens;
        
        UPDATE comvenda SET n_totavenda = vtotal_itens
			WHERE n_numevenda = OLD.n_numevenda;
    
END
$$
DELIMITER ;

#After delete
DELIMITER $$
CREATE TRIGGER tri_ivendas_af
BEFORE DELETE ON comivenda
FOR EACH ROW
BEGIN
	#Declara variáveis
    DECLARE vtotal_itens FLOAT(10, 2) DEFAULT 0;
    DECLARE total_item   FLOAT(10, 2) DEFAULT 0;
	DECLARE fimloop BOOLEAN DEFAULT FALSE;
    
    DECLARE busca_itens CURSOR FOR
		SELECT n_valoivenda
			FROM comivenda
				WHERE n_numevenda = OLD.n_numevenda;
    
    #Handler para encerrar o loop antes da última linha.
    DECLARE CONTINUE HANDLER FOR
		sqlstate '02000'
		SET fimloop = true;
    
    #Abro o cursor
    OPEN busca_itens;
    
    #Declaro o inicio do loop
    itens: LOOP
		
        FETCH busca_itens INTO total_item;
        
        #Encerra o bloco quando o cursor não retornar mais linhas.
        IF fimloop THEN
			LEAVE itens;
		END IF;
        
        #Soma o valor total dos itens
        SET vtotal_itens = vtotal_itens + total_item;
		
        END LOOP itens;
        
        CLOSE busca_itens;
        
        DELETE FROM comivenda WHERE n_numevenda = OLD.n_numevenda;
    
END
$$
DELIMITER ;  
  
  
  
  
  





