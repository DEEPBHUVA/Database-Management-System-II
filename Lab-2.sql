CREATE DATABASE EMPLOYEE_INFO;

SELECT * FROM EMPMASTER
CREATE TABLE EMPLOYEE3(
EID INT,NAME VARCHAR(100),GENDER VARCHAR(10),JOININGTIME Datetime,SALARY DECIMAL(8,2),CITY VARCHAR(100));

INSERT INTO EMPLOYEE3 VALUES
(1,'NICK','MALE','01-JAN-13',4000,'LONDON'),
(2,'JULIAN','FEMALE','01-OCT-14',3000,'NEW YORK'),
(3,'ROY','MALE','01-JUN-16',3500,'LONDON'),
(4,'TOM','MALE',NULL,4500,'LONDON'),
(5,'JERRY','MALE','01-FEB-13',2800,'SYDNEY'),
(6,'PHILIP','MALE','01-JAN-15',7000,'NEW YORK'),
(7,'SARA','FEMALE','01-AUG-17',4800,'SYDNEY'),
(8,'EMILY','FEMALE','01-JAN-15',5500,'NEW YORK'),
(9,'MICHAEL','MALE',NULL,6500,'LONDON'),
(10,'JOHN','MALE','01-JAN-15',8800,'LONDON');

SELECT * FROM EMPLOYEE3

--1. Display all the employees whose name starts with �m� and 4 th character is �h�.
	SELECT NAME FROM EMPLOYEE3
	WHERE NAME LIKE 'M__H%'

--2. Find the value of 3 raised to 5. Label the column as output.
	SELECT POWER(3,5) AS 'OUTPUT'

--3. Write a query to subtract 20 days from the current date.
	SELECT GETDATE()-20

--4. Write a query to display name of employees whose name starts with �j� and contains �n� in their name.
	SELECT NAME FROM EMPLOYEE3
	WHERE NAME LIKE 'J%N%'

--5. Display 2nd to 9th character of the given string �SQL Programming�.
	SELECT SUBSTRING('SQL Programming',2,9) 

--6. Display name of the employees whose city name ends with �ney� &contains six characters.
	SELECT NAME FROM EMPLOYEE3
	WHERE CITY LIKE '___NEY'

--7. Write a query to convert value 15 to string.
	SELECT CONVERT(VARCHAR(10),15)
	SELECT CAST(15 AS VARCHAR(10))

--8. Add department column with varchar (20) to Employee table.
	ALTER TABLE EMPLOYEE3 ADD  DEPARTMENT VARCHAR(20)
 
--9. Set the value of department to Marketing who belongs to London city.
	UPDATE EMPLOYEE3 SET DEPARTMENT='MARKETING' 
	WHERE CITY='LONDON'

--10. Display all the employees whose name ends with either �n� or �y�
	SELECT NAME FROM EMPLOYEE3
	WHERE NAME LIKE '%N' OR NAME LIKE '%Y'

--11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
	SELECT CEILING(63.1),CEILING(63.8), CEILING(-63.2)

--12. Display all employees whose joining date is not available
	SELECT NAME FROM EMPLOYEE3
	WHERE JOININGTIME IS NULL

--13. Display name of the employees in capital letters and city in small letters.
	SELECT UPPER(NAME),LOWER(CITY) FROM EMPLOYEE3

--14. Change the data type of Ename from varchar (30) to char (30).
	ALTER TABLE EMPLOYEE3 ALTER COLUMN NAME CHAR(30)

--15. Display city wise maximum salary.
	SELECT CITY ,MAX(SALARY) FROM EMPLOYEE3
	GROUP BY CITY

--16. Produce output like <Ename> works at <city> and earns <salary> (In single column).
	SELECT NAME+'WOEKS AT'+CITY+'AND EARNS'+CAST(SALARY AS VARCHAR(20)) FROM EMPLOYEE3

--17. Find total number of employees whose salary is more than 5000.
	SELECT COUNT(EID) FROM EMPLOYEE3
	WHERE SALARY > 5000

--18. Write a query to display first 4 & last 3 characters of all the employees.
	SELECT LEFT(NAME,4),RIGHT(NAME,3) FROM EMPLOYEE3

--19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
	SELECT CITY FROM EMPLOYEE3
	WHERE JOININGTIME>'01-01-2014'
	GROUP BY CITY
	HAVING SUM(SALARY)>15000

--20. Write a query to replace �u� with �oo� in Ename.
	SELECT REPLACE(NAME,'U','OO') FROM EMPLOYEE3

--21. Display city with average salaries and total number of employees belongs to each city.
	SELECT CITY,AVG(SALARY),COUNT(EID) FROM EMPLOYEE3
	GROUP BY CITY

--22. Display total salaries paid to female employees.
	SELECT SUM(SALARY) FROM EMPLOYEE3
	WHERE GENDER='FEMALE'

--23. Display name of the employees and their experience in years.
	SELECT NAME,DATEDIFF(YEAR,JOININGTIME,GETDATE()) FROM EMPLOYEE3

--24. Remove column department from employee table.
	ALTER TABLE EMPLOYEE3 DROP COLUMN DEPARTMENT

--25. Update the value of city from syndey to null.
	UPDATE EMPLOYEE3 SET CITY=NULL
	WHERE CITY='SYDNEY'

--26. Retrieve all Employee name, Salary & Joining date.
	SELECT NAME,SALARY,JOININGTIME FROM EMPLOYEE3

--27. Find out combine length of Ename & Gender.
	SELECT LEN(NAME+GENDER) FROM EMPLOYEE3

--28. Find the difference between highest & lowest salary.
	SELECT MAX(SALARY)-MIN(SALARY) FROM EMPLOYEE3

--29. Rename a column from Ename to FirstName.
	SP_RENAME 'EMPLOYEE3.NAME','FIRSTNAME'

--30. Rename a table from Employee to EmpMaster.
	SP_RENAME 'EMPLOYEE3','EMPMASTER'