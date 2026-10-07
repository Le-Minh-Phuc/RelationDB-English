-- Exercise 3 - COMPANY database (SQLite 3.25+ / DB Browser for SQLite)
-- Usage: open or create the file company.db, then run this script
--   DB Browser: tab 'Execute SQL' > open this file > Execute all (F5) > Write Changes (Ctrl+S)
--   Command line: sqlite3 company.db < ex3_company.sql
-- The script can be re-run at any time to reset the data.
-- (This is also the expected answer to Exercise 3, Question 1.)

PRAGMA foreign_keys = ON;   -- foreign keys are OFF by default in SQLite

DROP TABLE IF EXISTS mission;
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  deptno INT         NOT NULL PRIMARY KEY,
  dname  VARCHAR(20) NOT NULL,
  loc    VARCHAR(20) NOT NULL
);

CREATE TABLE emp (
  empno    INT           NOT NULL PRIMARY KEY,
  ename    VARCHAR(20)   NOT NULL,
  job      VARCHAR(20)   NOT NULL,
  mgr      INT,
  hiredate DATE          NOT NULL,
  sal      DECIMAL(7,2)  NOT NULL,
  comm     DECIMAL(7,2),
  deptno   INT           NOT NULL,
  CONSTRAINT fk_emp_dept FOREIGN KEY (deptno) REFERENCES dept(deptno),
  CONSTRAINT fk_emp_mgr  FOREIGN KEY (mgr)    REFERENCES emp(empno)
);

CREATE TABLE mission (
  missno  INT         NOT NULL PRIMARY KEY,
  empno   INT         NOT NULL,
  ciename VARCHAR(20) NOT NULL,
  local   VARCHAR(20) NOT NULL,
  enddate DATE,
  CONSTRAINT fk_mission_emp FOREIGN KEY (empno) REFERENCES emp(empno)
);

INSERT INTO dept VALUES
(10,'Accounting','New York'), (20,'Research','Dallas'),
(30,'Sales','Chicago'),       (40,'Operations','Boston');

-- Rows are inserted top-down (King first) so that every manager exists
-- before his subordinates (self-referencing foreign key on mgr).
INSERT INTO emp VALUES
(7839,'King','President',NULL,'1981-11-17',5000.00,NULL,10),
(7566,'Jones','Manager',7839,'1981-04-02',2975.00,NULL,20),
(7698,'Blake','Manager',7839,'1981-05-01',2850.00,NULL,30),
(7782,'Clark','Manager',7839,'1981-06-09',2450.00,NULL,10),
(7788,'Scott','Analyst',7566,'1981-11-09',3000.00,NULL,20),
(7902,'Ford','Analyst',7566,'1981-12-03',3000.00,NULL,20),
(7369,'Smith','Clerk',7902,'1981-12-17',800.00,NULL,20),
(7499,'Allen','Salesman',7698,'1981-02-20',1600.00,300.00,30),
(7521,'Ward','Salesman',7698,'1981-02-22',1250.00,500.00,30),
(7654,'Martin','Salesman',7698,'1981-09-28',1250.00,1400.00,30),
(7844,'Turner','Salesman',7698,'1981-09-08',1500.00,0.00,30),
(7876,'Adams','Clerk',7788,'1981-09-23',1100.00,NULL,20),
(7900,'James','Clerk',7698,'1981-12-03',950.00,NULL,30),
(7934,'Miller','Clerk',7782,'1981-12-23',1300.00,NULL,10);

INSERT INTO mission VALUES
(209,7654,'BMW','Berlin','2001-02-09'),
(212,7698,'McDo','Chicago','2001-03-04'),
(213,7902,'Oracle','Dallas','2001-04-11'),
(214,7900,'FIDAL','Paris','2001-06-07'),
(216,7698,'IBM','Chicago','2001-02-09'),
(218,7499,'Decathlon','Clermont','2002-12-24'),
(219,7782,'BMW','Chicago','2001-08-16');
