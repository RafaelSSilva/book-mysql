CREATE TABLE teste_index(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(255),
	INDEX index_cpf(cpf)
);

SHOW INDEX FROM teste_index;

ALTER TABLE comvenda ADD INDEX idx_comclien_2(n_numeclien); 
ALTER TABLE comvenda ADD INDEX idx_comclien_3(n_numeforne);
ALTER TABLE comvenda ADD INDEX idx_comclien_4(n_numevende);

#unique index
ALTER TABLE comvenda ADD UNIQUE INDEX idx_comclien_5(c_codivenda);

SHOW INDEX FROM comvenda;

ALTER TABLE teste_index DROP INDEX index_cpf;

ALTER TABLE comvenda DROP INDEX idx_comclien_2;
ALTER TABLE comvenda DROP INDEX idx_comclien_3;
ALTER TABLE comvenda DROP INDEX idx_comclien_4;
ALTER TABLE comvenda DROP INDEX idx_comclien_5;

