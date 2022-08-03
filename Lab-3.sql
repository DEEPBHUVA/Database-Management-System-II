select *from person
Select*from department

From the above given table perform the following queries:

-- 1. Find all persons with their department name & code. 
	SELECT Person.PersonName,
		   Department.DepartmentName,
		   Department.DepartmentCode
	from Person INNER JOIN department
	on Person.DepartmentId=Department.DepartmentId

-- 2. Give department wise maximum & minimum salary with department name.  
	SELECT DEPARTMENT.DEPARTMENTNAME,
		   MAX(PERSON.SALARY),MIN(PERSON.SALARY)
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	GROUP BY DEPARTMENT.DEPARTMENTNAME

-- 3. Find all departments whose total salary is exceeding 100000.  
	SELECT DEPARTMENT.DEPARTMENTNAME,
		   SUM(PERSON.SALARY)
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	GROUP BY DEPARTMENT.DEPARTMENTNAME
	HAVING SUM(PERSON.SALARY)>100000

--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
	SELECT PERSON.PERSONNAME,
		   PERSON.SALARY,
		   DEPARTMENT.DEPARTMENTNAME
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	WHERE PERSON.CITY='JAMNAGAR'	

--5. Find all persons who does not belongs to any department.
	SELECT PERSON.PERSONNAME
	FROM PERSON LEFT OUTER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	WHERE DEPARTMENT.DEPARTMENTID IS NULL

--6. Find department wise person counts.
	SELECT DEPARTMENT.DEPARTMENTNAME,
		   COUNT(PERSON.PERSONID)
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	GROUP BY DEPARTMENT.DEPARTMENTNAME

--7. Find average salary of person who belongs to Ahmedabad city.
	SELECT AVG(PERSON.SALARY)
	FROM PERSON LEFT OUTER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	WHERE PERSON.CITY='AHMEDABAD'

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly.
(In single column)
	SELECT PERSON.PERSONNAME+' EARNS '+CAST(PERSON.SALARY AS VARCHAR)+' FROM DEPARTMENT '+DEPARTMENT.DEPARTMENTNAME+' MONTHLY '
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId

--9. List all departments who have no persons.
	SELECT DEPARTMENT.DEPARTMENTNAME
	FROM PERSON FULL OUTER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	WHERE PERSON.DEPARTMENTID IS NULL

--10. Find city & department wise total, average & maximum salaries.
	 --DEPARTMENT WISE
	 SELECT DEPARTMENT.DEPARTMENTNAME,
		SUM(PERSON.SALARY),
		AVG(PERSON.SALARY),
		MAX(PERSON.SALARY)
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	GROUP BY DEPARTMENT.DEPARTMENTNAME
	--CITY WISE
	SELECT PERSON.CITY,
		SUM(PERSON.SALARY),
		AVG(PERSON.SALARY),
		MAX(PERSON.SALARY)
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	GROUP BY PERSON.CITY

--11. Display Unique city names.
	SELECT DISTINCT CITY FROM PERSON

--12. List out department names in which more than two persons.
	SELECT DEPARTMENT.DEPARTMENTNAME,
		   COUNT(PERSON.DEPARTMENTID)
	FROM PERSON RIGHT OUTER JOIN DEPARTMENT
	ON Person.DepartmentId=Department.DepartmentId
	GROUP BY DEPARTMENT.DEPARTMENTNAME
	HAVING COUNT(PERSON.DEPARTMENTID)>2

--13. Combine person name’s first three characters with city name’s last three characters in single column.
	SELECT LEFT(PERSONNAME,3)+RIGHT(CITY,3) 
	FROM PERSON

--14. Give 10% increment in Computer department employee’s salary.
	UPDATE PERSON 
	SET SALARY=((SALARY*10)/100)+SALARY
	WHERE DEPARTMENTID=(SELECT DEPARTMENTID FROM DEPARTMENT WHERE DEPARTMENTNAME='COMPUTER')

--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.
	SELECT PERSONNAME FROM PERSON
	WHERE (GETDATE()-JOININGDATE)>365