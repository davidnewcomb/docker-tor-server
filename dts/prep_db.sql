UPDATE mysql.user SET Password=PASSWORD('mysql') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# DROP DATABASE test;
# DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';

GRANT ALL PRIVILEGES ON heros.* TO 'user_hero'@'localhost'
IDENTIFIED BY 'user_hero';

FLUSH PRIVILEGES;

create database heros;

use heros;

drop table if exists hero;

create table hero (
	id INT NOT NULL AUTO_INCREMENT,
	real_name VARCHAR(50),
	persona VARCHAR(50),
	created DATETIME DEFAULT CURRENT_TIME,
	updated DATETIME DEFAULT CURRENT_TIME,
	PRIMARY KEY ( id )
	
);

INSERT INTO hero(real_name, persona) VALUES
	('Peter Parker', 'Spiderman')
	,('Clarke Kent', 'Superman')
	,('Diana Prince', 'Wonder Woman')
	;
