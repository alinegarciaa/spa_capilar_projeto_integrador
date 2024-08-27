CREATE USER 'usuario_leitura'@'localhost' IDENTIFIED BY 'senha_segura';
CREATE USER 'usuario_escrita'@'localhost' IDENTIFIED BY 'senha_segura';
CREATE USER 'usuario_administrador'@'localhost' IDENTIFIED BY 'senha_segura';

SELECT User, Host 
FROM mysql.user 
WHERE User IN ('usuario_leitura', 'usuario_escrita', 'usuario_administrador');

GRANT SELECT ON spa_capilar.* TO 'usuario_leitura'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON spa_capilar.* TO 'usuario_escrita'@'localhost';
GRANT ALL PRIVILEGES ON Spa_Capilar.* TO 'usuario_administrador'@'localhost';

SHOW GRANTS FOR 'usuario_leitura'@'localhost';
SHOW GRANTS FOR 'usuario_escrita'@'localhost';
SHOW GRANTS FOR 'usuario_administrador'@'localhost';

REVOKE ALL PRIVILEGES ON spa_capilar.* FROM 'usuario_leitura'@'localhost';
REVOKE ALL PRIVILEGES ON spa_capilar.* FROM 'usuario_escrita'@'localhost';
REVOKE ALL PRIVILEGES ON spa_capilar.* FROM 'usuario_administrador'@'localhost';

ALTER USER 'usuario_administrador'@'localhost' IDENTIFIED BY 'nova_senha_segura';
