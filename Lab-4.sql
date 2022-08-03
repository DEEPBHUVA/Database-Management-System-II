
--From the above given tables perform the following queries:
	--• Stored Procedures

--1. All tables Insert, Update & Delete

	--------------PERSON TABLE INSERT--------------
	CREATE PROCEDURE PR_PERSON_INSERT
	@WORKERID		INT,
	@FRISTNAME		VARCHAR(100),
	@LASTNAME		VARCHAR(100),
	@SALARY			DECIMAL(8,2),
	@JOININGDATE	DATETIME,
	@DEPARTMENTID	INT,
	@DESIGNATION	INT
	AS
	BEGIN
	INSERT INTO Person
	(
		WorkerID,
		FirstName,
		LastName,
		Salary,
		JoiningDate,
		DepartmentID,
		DesignationID
	)
	VALUES
	(
		@WORKERID,		
		@FRISTNAME,		
		@LASTNAME,		
		@SALARY,			
		@JOININGDATE,	
		@DEPARTMENTID,	
		@DESIGNATION
	)
	END
	EXEC PR_PERSON_INSERT 108,'Deep','Bhuva',90000,'01-07-2022',3,15
	SELECT * FROM Person

	--------------DEPARTMENT TABLE INSERT--------------
	CREATE PROCEDURE PR_DEPARTMENT_INSERT
	@DEPARTMENTID		INT,
	@DEPARTMENTNAME		VARCHAR(100)
	AS
	BEGIN
	INSERT INTO Department
	(
		DepartmentID,
		DepartmentName
	)
	VALUES
	(
		@DEPARTMENTID,	
		@DEPARTMENTNAME	
	)
	END
	EXEC PR_DEPARTMENT_INSERT 5,'ETC..'
	SELECT * FROM Department

	--------------DESIGNATION TABLE INSERT--------------
	CREATE PROCEDURE PR_DESIGNATION_INSERT
	@DESIGNATION			INT,
	@DESIGNATIONNAME		VARCHAR(100)
	AS
	BEGIN
	INSERT INTO Designation
	(
		DesignationID,
		DesignationName
	)
	VALUES
	(
		@DESIGNATION,	
		@DESIGNATIONNAME
	)
	END
	EXEC PR_DESIGNATION_INSERT 16,'Etc..'
	SELECT * FROM Designation

	--------------PERSON TABLE UPDATE--------------
	CREATE  PROCEDURE PR_PERSON_UPDATE
	@WORKERID		INT,
	@FRISTNAME		VARCHAR(100),
	@LASTNAME		VARCHAR(100),
	@SALARY			DECIMAL(8,2),
	@JOININGDATE	DATETIME,
	@DEPARTMENTID	INT,
	@DESIGNATION	INT
	AS
	BEGIN
	UPDATE Person
	SET					
		FirstName					=@FRISTNAME,	
		LastName					=@LASTNAME,		
		Salary						=@SALARY,			
		JoiningDate					=@JOININGDATE,	
		DepartmentID				=@DEPARTMENTID,	
		DesignationID				=@DESIGNATION
	WHERE WorkerID=@WORKERID
	END
	EXEC PR_PERSON_UPDATE 108,'Prit','Sharma',11000,'01-01-2001',4,16
	SELECT * FROM Person

	--------------DEPARTMENT TABLE UPDATE--------------
	CREATE PROCEDURE PR_DEPARTMENT_UPDATE
	@DEPARTMENTID		INT,
	@DEPARTMENTNAME		VARCHAR(100)
	AS
	BEGIN
	UPDATE Department
	SET 
		DepartmentName				=@DEPARTMENTNAME
	WHERE DepartmentID=@DEPARTMENTID
	END
	EXEC PR_DEPARTMENT_UPDATE 5,'XYZ'
	SELECT * FROM Department

	--------------DESIGNATION TABLE UPDATE--------------
	CREATE PROCEDURE PR_DESIGNATION_UPDATE
	@DESIGNATIONID			INT,
	@DESIGNATIONNAME		VARCHAR(100)
	AS
	BEGIN
	UPDATE Designation
	SET 
	DesignationName				=@DESIGNATIONNAME
	WHERE DesignationID=@DESIGNATIONID
	END
	EXEC PR_DESIGNATION_UPDATE 16,'XYZ'
	SELECT * FROM Designation

	--------------PERSON TABLE DELETE--------------
	CREATE  PROCEDURE PR_PERSON_DELETE
	@WORKERID		INT
	AS
	BEGIN
	DELETE FROM Person
	WHERE WorkerID=@WORKERID
	END
	EXEC PR_PERSON_DELETE 108
	SELECT * FROM Person

	--------------DEPATRMENT TABLE DELETE--------------
	CREATE  PROCEDURE PR_DEPARTMENT_DELETE
	@DEPARTMENTID		INT
	AS
	BEGIN
	DELETE FROM Department
	WHERE DepartmentID=@DEPARTMENTID
	END
	EXEC PR_DEPARTMENT_DELETE 5
	SELECT * FROM Department

	--------------DESIGNATION TABLE DELETE--------------
	CREATE  PROCEDURE PR_DESIGNATION_DELETE
	@DESIGNATIONID			INT
	AS
	BEGIN
	DELETE FROM Designation
	WHERE DesignationID=@DESIGNATIONID
	END
	EXEC PR_DESIGNATION_DELETE 16
	SELECT * FROM Designation

--2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)

--------------PERSON TABLE--------------
(-------------DEPARTMENTID FOREGIN KEY-------------)
	ALTER PROCEDURE PR_PERSON_SELECTALL
	@DEPARTMENTID		INT
	AS
	BEGIN
	SELECT 
		Person.WorkerID,
		Person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Person.DepartmentID,
		Person.DesignationID
	FROM Person
	WHERE DepartmentID=@DEPARTMENTID
	END
	EXEC PR_PERSON_SELECTALL 3

(-------------DESIGNATION FOREGIN KEY-------------)
	ALTER PROCEDURE PR_PERSON_SELECTALL1
	@DESIGNATIONID			INT
	AS
	BEGIN
	SELECT 
		Person.WorkerID,
		Person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Person.DepartmentID,
		Person.DesignationID
	FROM Person
	WHERE DesignationID=@DESIGNATIONID
	END
	EXEC PR_PERSON_SELECTALL1 15

--------------DEPARTMENT TABLE--------------
	CREATE PROCEDURE PR_DEPARTMENT_SELECTALL
	AS
	BEGIN
	SELECT 
		Person.WorkerID,
		Person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Person.DepartmentID,
		Person.DesignationID
	FROM Person 
	INNER JOIN Department
	ON Person.DepartmentID=Department.DepartmentID
	END
	EXEC PR_DEPARTMENT_SELECTALL

--------------DESIGNATION TABLE--------------
	CREATE PROCEDURE PR_DESIGNATION_SELECTALL
	AS
	BEGIN
	SELECT 
		Person.WorkerID,
		Person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Person.DepartmentID,
		Person.DesignationID
	FROM Person 
	INNER JOIN Designation
	ON Person.DesignationID=Designation.DesignationID
	END
	EXEC PR_DESIGNATION_SELECTALL

--3. All tables SelectPK
	
--------------PERSON TABLE PK--------------
	CREATE PROCEDURE PR_PERSON_SELECTBYPK
	@WORKERID		INT
	AS
	BEGIN
	SELECT 
		Person.WorkerID,
		Person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Person.DepartmentID,
		Person.DesignationID
	FROM Person 
	WHERE WorkerID=@WORKERID
	END
	EXEC PR_PERSON_SELECTBYPK 101

--------------DEPARTMENT TABLE PK--------------
	CREATE PROCEDURE PR_DEPARTMENT_SELECTBYPK
	@DEPARTMENTID		INT
	AS
	BEGIN
	SELECT
		Department.DepartmentID,
		Department.DepartmentName
	FROM Department
	WHERE DepartmentID=@DEPARTMENTID
	END
	EXEC PR_DEPARTMENT_SELECTBYPK 4

--------------DESIGNATION TABLE PK--------------
	CREATE PROCEDURE PR_DESIGNATION_SELECTBYPK
	@DESIGNATIONID		INT
	AS
	BEGIN
	SELECT
		Designation.DesignationID,
		Designation.DesignationName
	FROM Designation
	WHERE DesignationID=@DESIGNATIONID
	END
	EXEC PR_DESIGNATION_SELECTBYPK 11

--4. Create Procedure that takes Department Name & Designation Name as Input and Returns a 
--   table with Worker’s First Name, Salary, Joining Date & Department Name
	
	CREATE PROCEDURE PR_PERSON_DEPNAME
	@DESIGNATIONNAME		VARCHAR(100),
	@DEPARTMENTNAME			VARCHAR(100)
	AS
	BEGIN 
	SELECT PERSON.FIRSTNAME,
		   PERSON.SALARY,
		   PERSON.JOININGDATE,
		   DEPARTMENT.DEPARTMENTNAME
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentID=Department.DepartmentID
	END
	EXEC PR_PERSON_DEPNAME 'ADMIN','JOBBER'

--5. Create Procedure that takes FirstName as an input parameter and displays’ all the details of 
--   the worker with their department & designation name.

	ALTER PROCEDURE PR_PERSON_FRISTNAME
	@FRISTNAME		VARCHAR(100)
	AS
	BEGIN
	SELECT 
		Person.WorkerID,
		Person.FirstName,
		Person.LastName,
		Person.Salary,
		Person.JoiningDate,
		Person.DepartmentID,
		Person.DesignationID,
		DEPARTMENT.DEPARTMENTNAME,
		DESIGNATION.DESIGNATIONNAME
	FROM PERSON INNER JOIN DEPARTMENT
	ON Person.DepartmentID=Department.DepartmentID
		  INNER JOIN DESIGNATION
	ON Person.DesignationID=Designation.DesignationID
	WHERE FIRSTNAME=@FRISTNAME
	END
	EXEC PR_PERSON_FRISTNAME 'BHOOMI';

--6. Create Procedure which displays department wise maximum, minimum & total salaries
	CREATE PROCEDURE PR_MIN_MAX_TOTAL_SALARY
	AS
	BEGIN
	SELECT Department.DepartmentID,
		   MAX(PERSON.SALARY) AS 'Max_Salary',
		   MIN(PERSON.SALARY) AS 'Min_Salary',
		   SUM(PERSON.SALARY) AS 'Total_Salary'
	FROM Person INNER JOIN Department
	ON Person.DepartmentID=Department.DepartmentID
	GROUP BY Department.DepartmentID
	END
	EXEC PR_MIN_MAX_TOTAL_SALARY

===============================================================================
	--• Views
--1. Create a view that display first 100 workers details
	CREATE VIEW DISPLAY_DETAILS
	AS
	SELECT TOP 100 * FROM PERSON
	----------------------------
	SELECT * FROM DISPLAY_DETAILS
	
--2. Create a view that displays designation wise maximum, minimum & total salaries

	CREATE VIEW DESIGN_SALARY
	AS
	SELECT DESIGNATION.DESIGNATIONID,
		   MAX(PERSON.SALARY) AS 'Max_Salary',
		   MIN(PERSON.SALARY) AS 'Min_Salary',
		   SUM(PERSON.SALARY) AS 'Total_Salary'
	FROM PERSON INNER JOIN DESIGNATION
	ON PERSON.DESIGNATIONID=DESIGNATION.DESIGNATIONID
	GROUP BY DESIGNATION.DESIGNATIONID

	SELECT * FROM DESIGN_SALARY

--3. Create a view that displays Worker’s first name with their salaries & joining date, it also displays 
--   duration column which is difference of joining date with respect to current date.

	CREATE VIEW DISPLAY_FSJD
	AS
	SELECT FIRSTNAME,SALARY,JOININGDATE,DATEDIFF(YEAR,JOININGDATE,GETDATE())AS Duration FROM PERSON

	SELECT * FROM DISPLAY_FSJD

--4. Create a view which shows department & designation wise total number of workers.
	CREATE VIEW DEPARTMENT_TOTALWORKER
	AS
	SELECT DEPARTMENT.DEPARTMENTID,
		   COUNT(PERSON.WORKERID)AS 'Total_Worker'
	FROM PERSON RIGHT OUTER JOIN DEPARTMENT 
	ON PERSON.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENT.DEPARTMENTID
	---------------------------------
	ALTER VIEW DESIGNATION_TOTALWORKER
	AS
	SELECT DESIGNATION.DESIGNATIONID,
		   COUNT(PERSON.WORKERID)AS 'Total_Worker'
	FROM PERSON RIGHT OUTER JOIN DESIGNATION 
	ON PERSON.DESIGNATIONID=DESIGNATION.DESIGNATIONID
	GROUP BY DESIGNATION.DESIGNATIONID

	SELECT * FROM DESIGNATION_TOTALWORKER
	SELECT * FROM DEPARTMENT_TOTALWORKER

--5. Create a view that displays worker names who don’t have either in any department or 
--   designation.

	CREATE VIEW DOONT_HAVE
	AS
	SELECT FIRSTNAME FROM PERSON
	WHERE DEPARTMENTID IS NULL OR DESIGNATIONID IS NULL

	SELECT * FROM DOONT_HAVE

===============================================================================
	--• User Defined Functions
--1. Create a table valued function which accepts DepartmentID as a parameter & returns a worker 
--   table based on DepartmentID.
	
	ALTER FUNCTION FN_WORKERINFO(@DEPARTMENTID INT)
	RETURNS TABLE
	AS
	RETURN 
	(	
		SELECT 
			PERSON.WORKERID,
			PERSON.FIRSTNAME,
			PERSON.LASTNAME,
			PERSON.SALARY,
			PERSON.JOININGDATE,
			PERSON.DEPARTMENTID,
			PERSON.DESIGNATIONID
		FROM PERSON 
		INNER JOIN DEPARTMENT
		ON PERSON.DEPARTMENTID = DEPARTMENT.DEPARTMENTID
		WHERE PERSON.DEPARTMENTID=@DEPARTMENTID
	)
	SELECT * FROM FN_WORKERINFO(2)

--3. Create a scalar valued function which accepts two parameters start date & end date, and 
--returns a date difference in days.

	CREATE FUNCTION FN_DATEDIFF(
		@STARTDATE DATETIME, 
		@ENDDATE DATETIME
	)
	RETURNS INT
	AS
	BEGIN
		RETURN DATEDIFF(DAY, @STARTDATE,@ENDDATE)
	END
	SELECT dbo.FN_DATEDIFF('2004-04-17',GETDATE())AS 'DAY'
			
--4. Create a scalar valued function which accepts two parameters year in integer & month in 
--integer and returns total days in passed month & year.

	ALTER FUNCTION FN_YEAR_MONTH(@YEAR INT,@MONTH INT)
	RETURNS INT
	AS
	BEGIN 
		DECLARE @DATE DATE=CAST(CAST(@YEAR AS VARCHAR(4)) + RIGHT('0'+CAST(@MONTH AS VARCHAR(2)),2)+ '01'AS DATE)

		RETURN DATEDIFF(DAY,
		DATEADD(MONTH,DATEDIFF(MONTH,0,@DATE),0),
		DATEADD(MONTH,DATEDIFF(MONTH,0,@DATE)+1,0));
	END
	SELECT dbo.FN_YEAR_MONTH(2022,12)AS 'DAY'
