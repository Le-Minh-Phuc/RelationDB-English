-- Exercise 1 - ORDERS database (MySQL 8 / MariaDB 10.x)
DROP DATABASE IF EXISTS orders_db;
CREATE DATABASE orders_db;
USE orders_db;

CREATE TABLE suppliers (
  sno     NUMERIC(6)  NOT NULL PRIMARY KEY,
  name    VARCHAR(25) NOT NULL,
  address VARCHAR(25),
  city    VARCHAR(25) NOT NULL
);

CREATE TABLE products (
  pno    NUMERIC(6)    NOT NULL PRIMARY KEY,
  label  VARCHAR(25)   NOT NULL,
  price  NUMERIC(6,2)  NOT NULL,
  weight NUMERIC(6,2)  NOT NULL,
  color  VARCHAR(25)   NOT NULL
);

CREATE TABLE orders (
  ono NUMERIC(6) NOT NULL PRIMARY KEY,
  sno NUMERIC(6) NOT NULL,
  pno NUMERIC(6) NOT NULL,
  qty INT        NOT NULL,
  CONSTRAINT fk_orders_supplier FOREIGN KEY (sno) REFERENCES suppliers(sno),
  CONSTRAINT fk_orders_product  FOREIGN KEY (pno) REFERENCES products(pno)
);

INSERT INTO suppliers (sno, name, address, city) VALUES
(10,'Dupont',NULL,'Lille'),   (15,'Durand',NULL,'Lille'),
(17,'Lefebvre',NULL,'Lille'), (12,'Jacquet',NULL,'Lyon'),
(14,'Martin',NULL,'Nice'),    (13,'Durand',NULL,'Lyon'),
(11,'Martin',NULL,'Amiens'),  (19,'Maurice',NULL,'Paris'),
(16,'Dupont',NULL,'Paris');

INSERT INTO products (pno, label, price, weight, color) VALUES
(102,'armchair',1500,9,'red'),        (103,'desk',3500,30,'green'),
(101,'armchair',2000,7,'grey'),       (105,'wardrobe',2500,35,'red'),
(104,'desk',4000,40,'grey'),          (107,'drawer unit',1000,12,'yellow'),
(106,'drawer unit',1000,12,'grey'),   (108,'filing cabinet',1500,20,'blue');

INSERT INTO orders (ono, sno, pno, qty) VALUES
(1001,17,103,10), (1003,15,103,2),  (1005,17,102,1),
(1007,15,108,1),  (1011,19,107,12), (1013,13,107,5),
(1017,19,105,3),  (1019,14,103,10), (1023,10,102,8),
(1029,17,108,15);
