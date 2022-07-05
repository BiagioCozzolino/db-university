
-- Creo il database 
create database db_university;

-- uso ll database appena creato
use db_university;

-- Creo la tabella dipartimenti
create table dipartimenti (
	id INT not null auto_increment,
	nome varchar(255) not null,
	specializzazione varchar(255),
	citta varchar(255),
	primary key(id)
 );
 
-- Creo la tabella corsi di laurea
create table corsi_di_laurea (
	id INT not null auto_increment,
	nome varchar(255) not null,
	tipologia varchar(255),
	primary key(id)
 );

-- Setto la foreign key per collegare Dipartimenti e corsi di laurea
	
alter table corsi_di_laurea add column dipartimenti_id INT ;
alter table corsi_di_laurea add foreign KEY(dipartimenti_id) references dipartimenti(id);

-- Creo la tabella corsi
create table corsi (
	id INT not null auto_increment,
	nome varchar(255) not null,
	tipologia varchar(255),
	primary key(id)
 );

-- Setto la foreign key per collegare Corsi di laurea e corsi
	
alter table corsi add column corsi_di_laurea_id INT ;
alter table corsi add foreign KEY(corsi_di_laurea_id) references corsi_di_laurea(id);

-- Creo la tabella Studenti
create table studenti (
	id INT not null auto_increment,
	nome varchar(255) not null,
	cognome varchar(255) not null,
	matricola INT not null,
	data_di_nascita date not null,
	data_inizio_studi date,
	primary key(id)
 );

-- Setto la foreign key per collegare studenti e corso di laurea
	
alter table studenti add column corsi_di_laurea_id INT ;
alter table studenti add foreign KEY(corsi_di_laurea_id) references corsi_di_laurea(id);

-- Creo la tabella Insegnanti
create table insegnanti (
	id INT not null auto_increment,
	nome varchar(255) not null,
	cognome varchar(255) not null,
	matricola_insegnante INT not null,
	data_di_nascita date not null,
	data_inizio_contratto date,
	primary key(id)
 );

-- Setto la foreign key per collegare insegnanti e corsi
	
alter table corsi add column insegnanti_id INT ;
alter table corsi add foreign KEY(insegnanti_id) references insegnanti(id);


--  inserisco valori nella tabella dipartimenti
INSERT INTO db_university.dipartimenti
(nome, specializzazione, citta)
VALUES('Dipartimento di Informatica', 'Programmazione', 'Napoli');

INSERT INTO db_university.dipartimenti
(nome, specializzazione, citta)
VALUES('Dipartimento di Chimica', 'Tecnologia alimentari', 'Napoli');

INSERT INTO db_university.dipartimenti
(nome, specializzazione, citta)
VALUES('Dipartimento di Igengeria', 'Meccanica', 'Milano');

--  inserisco valori nella tabella corsi di laurea
INSERT INTO db_university.corsi_di_laurea
(nome, tipologia, dipartimenti_id)
VALUES('Corso di chimica avanzata', 'Teorica', 2);

INSERT INTO db_university.corsi_di_laurea
(nome, tipologia, dipartimenti_id)
VALUES('Corso di ignegneria meccanica', 'Teorica', 3);

INSERT INTO db_university.corsi_di_laurea
(nome, tipologia, dipartimenti_id)
VALUES('Corso di Programmazione in Java', 'Teorica e Pratica', 1);

--  inserisco valori nella tabella corsi

INSERT INTO db_university.corsi
(nome, tipologia, corsi_di_laurea_id)
VALUES('Corso chimica applicata', 'Pratica', 2);

INSERT INTO db_university.corsi
(nome, tipologia, corsi_di_laurea_id)
VALUES('Corso ignegneria applicata', 'Pratica', 3);

INSERT INTO db_university.corsi
(nome, tipologia, corsi_di_laurea_id)
VALUES('Corso programmazione applicata', 'Pratica', 1);

--  inserisco valori nella tabella Studenti
INSERT INTO db_university.studenti
(nome, cognome, matricola, data_di_nascita, data_inizio_studi, corsi_di_laurea_id)
VALUES('Biagio', 'Cozzolino', 1496, '1996-01-03', '2022-03-21', 3);

INSERT INTO db_university.studenti
(nome, cognome, matricola, data_di_nascita, data_inizio_studi, corsi_di_laurea_id)
VALUES('Paolo', 'Labriola', 1548, '2003-03-24', '2022-03-28', 3);

INSERT INTO db_university.studenti
(nome, cognome, matricola, data_di_nascita, data_inizio_studi, corsi_di_laurea_id)
VALUES('Antonio', 'Esposito', 1785, '1999-05-21', '2022-01-15', 1);

INSERT INTO db_university.studenti
(nome, cognome, matricola, data_di_nascita, data_inizio_studi, corsi_di_laurea_id)
VALUES('Mario', 'Rossi', 1245, '1994-02-21', '2021-02-19', 2);

INSERT INTO db_university.studenti
(nome, cognome, matricola, data_di_nascita, data_inizio_studi, corsi_di_laurea_id)
VALUES('Luigi', 'Pirandello', 1147, '1999-03-14', '2020-05-24', 1);

--  inserisco valori nella tabella Insegnanti

INSERT INTO db_university.insegnanti
(nome, cognome, matricola_insegnante, data_di_nascita, data_inizio_contratto)
VALUES('Ciro', 'Esposito', 8575, '1978-01-21', '2003-05-21');

INSERT INTO db_university.insegnanti
(nome, cognome, matricola_insegnante, data_di_nascita, data_inizio_contratto)
VALUES('Mario', 'Garofalo', 9758, '1987-03-22', '2005-01-14');

INSERT INTO db_university.insegnanti
(nome, cognome, matricola_insegnante, data_di_nascita, data_inizio_contratto)
VALUES('Luigi', 'Pirozzi', 7854, '1985-08-21', '2000-04-28');

-- Modifico corsi per inserire id insegnanti
UPDATE db_university.corsi
SET insegnanti_id=3
WHERE id=1;
UPDATE db_university.corsi
SET insegnanti_id=1
WHERE id=2;
UPDATE db_university.corsi
SET insegnanti_id=2
WHERE id=3;

