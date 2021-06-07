CREATE OR REPLACE VIEW
	clientes_vendas AS
		SELECT
			c_razaclien,
            n_numevenda,
            d_datavenda
        FROM comclien, comvenda
        WHERE	comclien.n_numeclien = comvenda.n_numeclien;

SELECT * FROM clientes_vendas;
DROP VIEW clientes_vendas;        

CREATE OR REPLACE VIEW produtos AS
			SELECT n_numeprodu,
				   c_codiprodu,
                   c_descprodu,
                   n_valoprodu,
                   c_situprodu,
                   n_numeforne
			FROM comprodu;

SELECT * FROM produtos;
DROP VIEW produtos;

INSERT INTO produtos VALUES(10, 5443445, 'DESCRIÇÃO', 1000.00, 'A', 2);
UPDATE produtos SET n_valoprodu = 9999 WHERE n_numeprodu = 10; 
DELETE FROM produtos WHERE n_numeprodu = 10;