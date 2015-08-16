drop database bugzilladb;
drop database bugs;
drop user bugs;
create database bugzilladb;
drop user bugzillauser@localhost;
CREATE USER 'bugzillauser'@'localhost' IDENTIFIED BY 'iit123';

GRANT ALL ON bugzilladb.* TO 'bugzillauser'@'localhost';

flush privileges;
