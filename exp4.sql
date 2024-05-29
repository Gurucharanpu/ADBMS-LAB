-- 1. Find all departments where the total salary is greater than the average of the total salary at all departments
SELECT dept_name FROM instructor GROUP BY dept_name HAVING SUM(salary) > (SELECT AVG(total_salary)
FROM (SELECT SUM(salary) AS total_salary FROM instructor GROUP BY dept_name) AS subquery);
-- 2. List the names of instructors along with the course ID of the courses that they taught.
SELECT instructor.name, teacher.course_id FROM instructor JOIN teacher ON instructor.ID = teacher.ID;
-- 3. List the names of instructors along with the course ID of the courses that they taught. In case, an instructor teaches no courses keep the course ID as null.
SELECT instructor.name, teacher.course_id FROM instructor LEFT JOIN teacher ON instructor.ID = teacher.ID;
-- 4. Create a view of instructors without their salary called faculty
CREATE VIEW faculty AS SELECT ID, name, dept_name FROM instructor;
select * from faculty;
-- 5. Give select privileges on the view faculty to the new user.
GRANT SELECT ON faculty TO new_user;