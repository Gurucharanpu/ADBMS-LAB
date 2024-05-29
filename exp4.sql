-- 1. Find all departments where the total salary is greater than the average of the total salary at all departments

SELECT dept_name FROM EMPLOYEE GROUP BY dept_name HAVING SUM(salary) > (SELECT AVG(total_salary) FROM (SELECT SUM(salary) AS total_salary FROM EMPLOYEE GROUP BY dept_name) AS subquery);
+------------+
| dept_name  |
+------------+
| Comp. Sci. |
| Finance    |
| Physics    |
+------------+


-- 2. List the names of instructors along with the course ID of the courses that they taught.

SELECT EMPLOYEE.name, TEACHES.course_id FROM EMPLOYEE JOIN TEACHES ON EMPLOYEE.
+------------+-----------+
| name       | course_id |
+------------+-----------+
| Srinivasan | CS-101    |
| Srinivasan | CS-315    |
| Srinivasan | CS-347    |
| Wu         | FIN-201   |
| Mozart     | MU-199    |
| Einstein   | PHY-101   |
| El Said    | HIS-351   |
| Katz       | CS-101    |
| Katz       | CS-319    |
| Crick      | BIO-101   |
| Crick      | BIO-301   |
| Brandt     | CS-190    |
| Brandt     | CS-319    |
| Kim        | EE-181    |
+------------+-----------+

select name, course_id from EMPLOYEE, TEACHES where EMPLOYEE.ID=TEACHES.ID;
+------------+-----------+
| name       | course_id |
+------------+-----------+
| Srinivasan | CS-101    |
| Srinivasan | CS-315    |
| Srinivasan | CS-347    |
| Wu         | FIN-201   |
| Mozart     | MU-199    |
| Einstein   | PHY-101   |
| El Said    | HIS-351   |
| Katz       | CS-101    |
| Katz       | CS-319    |
| Crick      | BIO-101   |
| Crick      | BIO-301   |
| Brandt     | CS-190    |
| Brandt     | CS-319    |
| Kim        | EE-181    |
+------------+-----------+

-- 3. List the names of instructors along with the course ID of the courses that they taught. In case, an instructor teaches no courses keep the course ID as null.

SELECT EMPLOYEE.name, TEACHES.course_id FROM EMPLOYEE left JOIN TEACHES ON EMPLOYEE.ID = TEACHES.ID;
+------------+-----------+
| name       | course_id |
+------------+-----------+
| Srinivasan | CS-101    |
| Srinivasan | CS-315    |
| Srinivasan | CS-347    |
| Wu         | FIN-201   |
| Mozart     | MU-199    |
| Einstein   | PHY-101   |
| El Said    | HIS-351   |
| Gold       | NULL      |
| Katz       | CS-101    |
| Katz       | CS-319    |
| Califieri  | NULL      |
| Singh      | NULL      |
| Crick      | BIO-101   |
| Crick      | BIO-301   |
| Brandt     | CS-190    |
| Brandt     | CS-319    |
| Kim        | EE-181    |
+------------+-----------+

-- 4. Create a view of instructors without their salary called faculty

CREATE VIEW faculty AS SELECT ID, name, dept_name FROM instructor;
select * from faculty;
+-------+------------+------------+
| ID    | name       | dept_name  |
+-------+------------+------------+
| 10101 | Srinivasan | Comp. Sci. |
| 12121 | Wu         | Finance    |
| 15151 | Mozart     | Music      |
| 22222 | Einstein   | Physics    |
| 32343 | El Said    | History    |
| 33456 | Gold       | Physics    |
| 45565 | Katz       | Comp. Sci. |
| 58583 | Califieri  | History    |
| 76543 | Singh      | Finance    |
| 76766 | Crick      | Biology    |
| 83821 | Brandt     | Comp. Sci. |
| 98345 | Kim        | Elec. Eng. |
+-------+------------+------------+

-- 5. Give select privileges on the view faculty to the new user.
GRANT SELECT ON faculty TO new_user;
