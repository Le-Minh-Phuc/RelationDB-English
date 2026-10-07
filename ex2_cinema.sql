-- Exercise 2 - CINEMA database (MySQL 8 / MariaDB 10.x)
DROP DATABASE IF EXISTS cinema_db;
CREATE DATABASE cinema_db;
USE cinema_db;

CREATE TABLE artist (
  last_name  VARCHAR(20) NOT NULL PRIMARY KEY,
  first_name VARCHAR(15),
  birth_year DECIMAL(4,0)
);

CREATE TABLE cinema (
  cinema_name VARCHAR(10) NOT NULL PRIMARY KEY,
  district    DECIMAL(2,0),          -- Paris "arrondissement"
  address     VARCHAR(30)
);

CREATE TABLE film (
  film_id       DECIMAL(10,0) NOT NULL PRIMARY KEY,
  title         VARCHAR(40),
  year          DECIMAL(4,0),
  director_name VARCHAR(20)          -- refers to artist.last_name
);

CREATE TABLE role (
  role_name  VARCHAR(20)   NOT NULL,
  film_id    DECIMAL(10,0) NOT NULL,
  actor_name VARCHAR(20)   NOT NULL, -- refers to artist.last_name
  PRIMARY KEY (film_id, actor_name)
);

CREATE TABLE screen (
  cinema_name     VARCHAR(10)  NOT NULL,
  screen_no       DECIMAL(2,0) NOT NULL,
  air_conditioned CHAR(1),            -- 'Y' = yes, 'N' = no
  capacity        DECIMAL(4,0),
  PRIMARY KEY (cinema_name, screen_no)
);

CREATE TABLE screening (
  cinema_name  VARCHAR(10)   NOT NULL,
  screen_no    DECIMAL(2,0)  NOT NULL,
  screening_no DECIMAL(2,0)  NOT NULL,
  start_time   TIME,
  end_time     TIME,
  film_id      DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (cinema_name, screen_no, screening_no)
);

INSERT INTO artist VALUES
('Allen','Woody',1935), ('Lynch','David',1946), ('Kusturica','Emir',1954),
('Lang','Fritz',1890), ('Eastwood','Clint',1930), ('Hitchcock','Alfred',1899),
('Kubrick','Stanley',1928), ('Curtiz','Michael',1886), ('Stewart','James',1908),
('Novak','Kim',NULL), ('McTiernan','John',1951), ('Tarantino','Quentin',1963),
('Willis','Bruce',1955), ('Spielberg','Steven',1946), ('Hudson','Hugh',1936),
('Gilliam','Terry',1940), ('Truffaut','Francois',1932), ('Lambert','Christophe',1957),
('Keitel','Harvey',1939), ('Woo','John',1946), ('Travolta','John',1954),
('Cage','Nicolas',1964), ('DiCaprio','Leonardo',1974), ('Cameron','James',1954),
('Cruise','Tom',1962), ('De Palma','Brian',1940), ('Depp','Johnny',1963),
('Ricci','Christina',1980), ('Burton','Tim',1958), ('Harlin','Renny',1959);

INSERT INTO cinema VALUES
('Rex',2,'22 Bd Poissonniere'), ('Kino',15,'3 Bd Raspail'),
('Nations',12,'3 Rue de Reuilly'), ('Halles',1,'Forum des Halles');

INSERT INTO film VALUES
(10,'Annie Hall',1977,'Allen'), (57,'Brazil',1985,'Gilliam'),
(5,'Underground',1995,'Kusturica'), (38,'Metropolis',1927,'Lang'),
(45,'Unforgiven',1992,'Eastwood'), (65,'Vertigo',1958,'Hitchcock'),
(7,'The Shining',1980,'Kubrick'), (6,'Psycho',1960,'Hitchcock'),
(3,'Twin Peaks',1990,'Lynch'), (90,'Casablanca',1942,'Curtiz'),
(85,'Greystoke',1984,'Hudson'), (89,'The Last Metro',1980,'Truffaut'),
(1,'Reservoir Dogs',1992,'Tarantino'), (43,'Manhattan',1979,'Allen'),
(11,'Jurassic Park',1993,'Spielberg'), (32,'Close Encounters',1977,'Spielberg'),
(33,'Die Hard',1988,'McTiernan'), (34,'Die Hard with a Vengeance',1995,'McTiernan'),
(35,'Die Hard 2',1990,'Harlin'), (73,'Pulp Fiction',1994,'Tarantino'),
(101,'Broken Arrow',1996,'Woo'), (102,'Face/Off',1997,'Woo'),
(104,'Titanic',1997,'Cameron'), (135,'Mission: Impossible 2',2000,'Woo'),
(136,'Mission: Impossible',1996,'De Palma'), (142,'Edward Scissorhands',1990,'Burton'),
(141,'Sleepy Hollow',1999,'Burton');

INSERT INTO role VALUES
('Lacombe',32,'Truffaut'), ('Davis',43,'Allen'), ('Tarzan',85,'Lambert'),
('Ferguson',65,'Stewart'), ('Elster',65,'Novak'), ('Jonas',10,'Allen'),
('McClane',33,'Willis'), ('McClane',34,'Willis'), ('McClane',35,'Willis'),
('Mr Brown',1,'Tarantino'), ('Munny',45,'Eastwood'), ('Mr White',1,'Keitel'),
('Wolf',73,'Keitel'), ('Coolidge',73,'Willis'), ('Vega',73,'Travolta'),
('Deakins',101,'Travolta'), ('Archer',102,'Travolta'), ('Troy',102,'Cage'),
('Dawson',104,'DiCaprio'), ('Hunt',135,'Cruise'), ('Hunt',136,'Cruise'),
('Crane',141,'Depp'), ('Edward',142,'Depp'), ('Van Tassel',141,'Ricci');

INSERT INTO screen VALUES
('Rex',1,'Y',150), ('Rex',2,'Y',100), ('Rex',3,'N',80), ('Rex',4,'N',80),
('Kino',1,'N',280), ('Kino',2,'Y',120), ('Kino',3,'Y',130),
('Nations',1,'Y',130), ('Nations',2,'N',90), ('Nations',3,'N',60),
('Halles',1,'Y',75), ('Halles',2,'N',60), ('Halles',3,'N',60);

INSERT INTO screening VALUES
('Rex',1,3,'18:00','19:45',1),     ('Rex',1,4,'20:30','22:20',6),
('Rex',2,1,'14:00','16:10',34),    ('Rex',2,2,'20:00','22:10',34),
('Rex',2,3,'16:30','18:55',7),     ('Rex',2,4,'22:30','00:40',65),
('Rex',3,1,'14:00','16:10',11),    ('Rex',3,2,'17:00','19:10',11),
('Rex',3,3,'20:00','22:10',11),    ('Rex',4,1,'14:00','16:30',38),
('Rex',4,2,'17:00','19:30',38),    ('Rex',4,3,'20:00','22:30',38),
('Kino',1,1,'13:30','15:40',34),   ('Kino',1,2,'16:00','18:40',73),
('Kino',1,3,'21:00','23:10',34),   ('Kino',2,1,'14:00','15:40',43),
('Kino',2,2,'16:00','18:25',7),    ('Kino',2,3,'20:00','21:40',43),
('Kino',3,1,'14:00','15:50',101),  ('Kino',3,2,'16:30','18:50',102),
('Kino',3,3,'19:00','22:15',104),  ('Kino',3,4,'22:30','01:45',104),
('Nations',1,1,'20:00','22:10',65),
('Nations',3,1,'14:00','16:25',7), ('Nations',3,2,'17:00','19:25',7),
('Nations',3,3,'20:00','22:25',7),
('Halles',1,1,'14:00','16:15',32), ('Halles',1,2,'17:00','19:15',32),
('Halles',1,3,'20:00','22:15',32), ('Halles',2,1,'14:00','16:50',5),
('Halles',2,2,'17:30','20:20',5),  ('Halles',2,3,'21:00','23:10',45),
('Halles',3,1,'14:00','15:45',3),  ('Halles',3,2,'17:00','18:45',3),
('Halles',3,3,'20:00','21:45',3);
