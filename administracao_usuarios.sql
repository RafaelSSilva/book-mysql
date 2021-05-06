#Criar usuário local
CREATE USER admin@localhost IDENTIFIED BY 'admin';

#Criar usuário remoto
CREATE USER admin2@'%' IDENTIFIED BY 'admin2';

#Verificar privilégios do user
SHOW GRANTS FOR admin@localhost;

#Atribuir acesso administrativo(sem privilégio) 
GRANT USAGE ON *.* TO admin@localhost;

#Permite dar privilégios a outros usuários.
GRANT USAGE ON *.* TO admin@localhost WITH GRANT OPTION;
GRANT ALL ON *.* TO admin@localhost WITH GRANT OPTION;

#Atribuir acesso específico aos comandos select, insert, update, delete para todas as tabelas de uma base especifica.
GRANT SELECT, INSERT, UPDATE, DELETE ON base.* TO admin@localhost;

#Atribuir privilégios para uma tabela específica.
GRANT SELECT, INSERT ON base.tabela_x TO admin@localhost;

#Atribuir privilégio total ao user
GRANT ALL ON *.* TO admin@localhost;

#Revogar privilégio total
REVOKE ALL ON *.* FROM admin@localhost;

#Revogar acesso administrativo 
REVOKE USAGE ON *.* FROM admin@localhost;

#Revoga permissão de update na coluna
REVOKE UPDATE (coluna_x) ON base_x.tabela_x FROM admin@localhost;



 
