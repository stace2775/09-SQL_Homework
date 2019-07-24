/*  
 
 Description:
	09-SQL_Homework:  Create Tables


 Modification Summary:
 DD-MMM-YYYY     Author              Description
 23-Jul-2019    Stacey Smith		 Initial Creation
																		
*/  

DROP TABLE IF EXISTS DEPT_EMP;
DROP TABLE IF EXISTS DEPT_MGR;
DROP TABLE IF EXISTS SALARY;
DROP TABLE IF EXISTS TITLES;
DROP TABLE IF EXISTS EMP;
DROP TABLE IF EXISTS DEPT;

--========================================================================================

--CREATE TABLES

CREATE TABLE DEPT (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(100) NOT NULL
  );
  
CREATE TABLE EMP (
	emp_no INT PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE DEPT_EMP(
	emp_no INT references EMP(emp_no),
	dept_no VARCHAR(10) references DEPT(dept_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
  );


CREATE TABLE DEPT_MGR(
	dept_no VARCHAR(10) references DEPT(dept_no),
	emp_no INT references EMP(emp_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
  );

CREATE TABLE SALARY(
	emp_no INT references EMP(emp_no),
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL	
  );

CREATE TABLE TITLES(
	emp_no INT references EMP(emp_no),
	title VARCHAR(100) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
  );

--POPULATE TABLES

COPY DEPT(dept_no, dept_name)
FROM 'c:\users\stacey.smith\source\09-SQL_Homework\data\departments.csv' DELIMITER ',' CSV HEADER;

COPY EMP(emp_no, birth_date, first_name, last_name, gender, hire_date)
FROM 'c:\users\stacey.smith\source\09-SQL_Homework\data\employees.csv' DELIMITER ',' CSV HEADER;

COPY DEPT_EMP(emp_no, dept_no, from_date, to_date)
FROM 'c:\users\stacey.smith\source\09-SQL_Homework\data\dept_emp.csv' DELIMITER ',' CSV HEADER;

COPY DEPT_MGR(dept_no, emp_no, from_date, to_date)
FROM 'c:\users\stacey.smith\source\09-SQL_Homework\data\dept_manager.csv' DELIMITER ',' CSV HEADER;

COPY SALARY(emp_no, salary, from_date, to_date)
FROM 'c:\users\stacey.smith\source\09-SQL_Homework\data\salaries.csv' DELIMITER ',' CSV HEADER;

COPY TITLES(emp_no, title, from_date, to_date)
FROM 'c:\users\stacey.smith\source\09-SQL_Homework\data\titles.csv' DELIMITER ',' CSV HEADER;

--========================================================================================
