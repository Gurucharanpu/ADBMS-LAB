
CREATE TABLE salesman (
  salesman_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  city VARCHAR(30),
  commission decimal(10,2),
    yr int(20)
);

INSERT INTO salesman VALUES(5001,'James Hoog','New York',0.15,2003);
INSERT INTO salesman VALUES(5002,'Nail Knite','Paris',0.13,2003);
INSERT INTO salesman VALUES(5005,'Pit Alex','London',0.11,2003);
INSERT INTO salesman VALUES(5006,'Mc Lyon','Paris',0.14,2003);
INSERT INTO salesman VALUES(5003,'Lauson Hen','',0.12,2003);
INSERT INTO salesman VALUES(5007,'Paul Adam','Rome',0.13,2003);
SELECT * FROM salesman;

+-------------+------------+----------+------------+------+
| salesman_id | name       | city     | commission | yr   |
+-------------+------------+----------+------------+------+
|        5001 | James Hoog | New York |       0.15 | 2003 |
|        5002 | Nail Knite | Paris    |       0.13 | 2003 |
|        5003 | Lauson Hen |          |       0.12 | 2003 |
|        5005 | Pit Alex   | London   |       0.11 | 2003 |
|        5006 | Mc Lyon    | Paris    |       0.14 | 2003 |
|        5007 | Paul Adam  | Rome     |       0.13 | 2003 |
+-------------+------------+----------+------------+------+


CREATE TABLE customer1 (
  customer_id INTEGER PRIMARY KEY,
  customer_name TEXT NOT NULL,
  city VARCHAR(30),
  grade INTEGER,
  salesman_id INTEGER,
  CONSTRAINT FK_sales FOREIGN KEY (salesman_id)
  REFERENCES salesman(salesman_id)
);

INSERT INTO customer1 VALUES(3002,'Nick Rimando','New York',100,5001);
INSERT INTO customer1 VALUES(3005,'Graham Zusi','California',200,5002);
INSERT INTO customer1 VALUES(3001,'Brad Guzan','London',NULL,NULL);

SELECT * FROM customer1;

+-------------+---------------+------------+-------+-------------+
| customer_id | customer_name | city       | grade | salesman_id |
+-------------+---------------+------------+-------+-------------+
|        3001 | Brad Guzan    | London     |  NULL |        NULL |
|        3002 | Nick Rimando  | New York   |   100 |        5001 |
|        3005 | Graham Zusi   | California |   200 |        5002 |
+-------------+---------------+------------+-------+-------------+


CREATE TABLE order1(
  order_no INTEGER PRIMARY KEY,
  purch_amt float,
  order_date DATE NOT NULL,
  customer_id INTEGER,
  salesman_id INTEGER,
  CONSTRAINT FK_cus FOREIGN KEY (customer_id)
  REFERENCES customer1(customer_id),
  CONSTRAINT FK_sale FOREIGN KEY (salesman_id)
  REFERENCES salesman(salesman_id)
);

INSERT INTO order1 VALUES(70001,150.5,'2016-10-05',3005,5002);
INSERT INTO order1 VALUES(70009,270.65,'2016-09-10',3001,NULL);
INSERT INTO order1 VALUES(70002,65.26,'2016-10-05',3002,5001);
SELECT * FROM order1;

+----------+-----------+------------+-------------+-------------+
| order_no | purch_amt | order_date | customer_id | salesman_id |
+----------+-----------+------------+-------------+-------------+
|    70001 |     150.5 | 2016-10-05 |        3005 |        5002 |
|    70002 |     65.26 | 2016-10-05 |        3002 |        5001 |
|    70009 |    270.65 | 2016-09-10 |        3001 |        NULL |
+----------+-----------+------------+-------------+-------------+

SELECT name,commission
FROM salesman;
+------------+------------+
| name       | commission |
+------------+------------+
| James Hoog |       0.15 |
| Nail Knite |       0.13 |
| Lauson Hen |       0.12 |
| Pit Alex   |       0.11 |
| Mc Lyon    |       0.14 |
| Paul Adam  |       0.13 |
+------------+------------+

SELECT DISTINCT salesman_id
FROM order1;
+-------------+
| salesman_id |
+-------------+
|        NULL |
|        5001 |
|        5002 |
+-------------+

SELECT name,city
FROM salesman
WHERE city='Paris';
+------------+-------+
| name       | city  |
+------------+-------+
| Nail Knite | Paris |
| Mc Lyon    | Paris |
+------------+-------+

SELECT*
FROM customer1
WHERE grade=200;

+-------------+---------------+------------+-------+-------------+
| customer_id | customer_name | city       | grade | salesman_id |
+-------------+---------------+------------+-------+-------------+
|        3005 | Graham Zusi   | California |   200 |        5002 |
+-------------+---------------+------------+-------+-------------+

SELECT order_no,order_date,purch_amt
FROM order1
WHERE salesman_id=5001;

+----------+------------+-----------+
| order_no | order_date | purch_amt |
+----------+------------+-----------+
|    70002 | 2016-10-05 |     65.26 |
+----------+------------+-----------+

SELECT city
FROM salesman
WHERE salesman_id=5005
AND commission = 0.11;
+--------+
| city   |
+--------+
| London |
+--------+

SELECT *
FROM salesman
WHERE city like 'Paris%';
+-------------+------------+-------+------------+------+
| salesman_id | name       | city  | commission | yr   |
+-------------+------------+-------+------------+------+
|        5002 | Nail Knite | Paris |       0.13 | 2003 |
|        5006 | Mc Lyon    | Paris |       0.14 | 2003 |
+-------------+------------+-------+------------+------+

SELECT *
FROM salesman
WHERE(name='Mc Lyon'AND city='Paris')
UNION
(SELECT*
    FROM salesman
    WHERE(name='Pit Alex' AND city ='London')
    );
+-------------+----------+--------+------------+------+
| salesman_id | name     | city   | commission | yr   |
+-------------+----------+--------+------------+------+
|        5006 | Mc Lyon  | Paris  |       0.14 | 2003 |
|        5005 | Pit Alex | London |       0.11 | 2003 |
+-------------+----------+--------+------------+------+


SELECT*
FROM salesman
WHERE yr=2003
AND city not in ('Paris');
+-------------+------------+----------+------------+------+
| salesman_id | name       | city     | commission | yr   |
+-------------+------------+----------+------------+------+
|        5001 | James Hoog | New York |       0.15 | 2003 |
|        5003 | Lauson Hen |          |       0.12 | 2003 |
|        5005 | Pit Alex   | London   |       0.11 | 2003 |
|        5007 | Paul Adam  | Rome     |       0.13 | 2003 |
+-------------+------------+----------+------------+------+

CREATE TABLE employee (
  employee_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  city VARCHAR(30),
  commission decimal(10,2),
    yr int(20),
    age int(20)
);

INSERT INTO employee VALUES(001,'James Hoog','New York',0.15,2003,12);
INSERT INTO employee VALUES(002,'Nail Knite','Paris',0.13,2003,45);
INSERT INTO employee VALUES(005,'Pit Alex','London',0.11,2003,54);
INSERT INTO employee VALUES(006,'Mc Lyon','Paris',0.14,2003,13);
INSERT INTO employee VALUES(003,'Lauson Hen','',0.12,2003,55);
INSERT INTO employee VALUES(007,'Paul Adam','Rome',0.13,2003,23);
SELECT * FROM employee;
+-------------+------------+----------+------------+------+------+
| employee_id | name       | city     | commission | yr   | age  |
+-------------+------------+----------+------------+------+------+
|           1 | James Hoog | New York |       0.15 | 2003 |   12 |
|           2 | Nail Knite | Paris    |       0.13 | 2003 |   45 |
|           3 | Lauson Hen |          |       0.12 | 2003 |   55 |
|           5 | Pit Alex   | London   |       0.11 | 2003 |   54 |
|           6 | Mc Lyon    | Paris    |       0.14 | 2003 |   13 |
|           7 | Paul Adam  | Rome     |       0.13 | 2003 |   23 |
+-------------+------------+----------+------------+------+------+

 
