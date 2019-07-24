/*  
 
 Description:
	09-SQL_Homework:  Data Analysis


 Modification Summary:
 DD-MMM-YYYY     Author              Description
 23-Jul-2019    Stacey Smith		 Initial Creation
																		
*/  

--DATA ANALYSIS
--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	E.emp_no AS Employee_Number,
	E.last_name || ', ' || E.first_name AS Full_Name,
	--E.first_name AS First_Name,
	E.gender AS Gender,
	S.salary AS Salary
FROM emp E
JOIN salary S
ON E.emp_no = S.emp_no
ORDER BY Full_Name;


--List employees who were hired in 1986.
SELECT * FROM emp 
WHERE hire_date BETWEEN '1/1/1986' and '12/31/1986'
ORDER BY hire_date;


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
	DM.dept_no AS Department_Number,
	D.dept_name AS Department_Name,
	DM.emp_no AS Employee_Number,
	E.last_name || ', ' || E.first_name AS Mgr_Full_Name,
	--E.last_name AS Mgr_Last_Name,
	--E.first_name AS Mgr_First_Name,
	DE.from_date AS Start_Date,
	DE.to_date AS End_Date

FROM dept_mgr DM
JOIN dept_emp DE
ON DM.emp_no = DE.emp_no
JOIN dept D
ON D.dept_no = DM.dept_no
JOIN emp E
ON E.emp_no = DE.emp_no
ORDER BY department_name;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	E.emp_no AS Employee_Number,
	E.last_name || ', ' || E.first_name AS Full_Name,
	--E.last_name AS Last_Name,
	--E.first_name AS First_Name,
	D.dept_name AS Department_Name
FROM emp E
JOIN dept_emp DE
ON E.emp_no = DE.emp_no
JOIN dept D
ON D.dept_no = DE.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT E.last_name || ', ' || E.first_name AS Full_Name
	--first_name,
	--last_name
FROM emp E
WHERE first_name = 'Hercules' and last_name like 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	DE.emp_no,
	E.last_name || ', ' || E.first_name AS Full_Name,
	--E.last_name,
	--E.first_name,
	D.dept_name
FROM dept_emp DE
JOIN dept D
ON D.dept_no = DE.dept_no
JOIN emp E
ON E.emp_no = DE.emp_no
WHERE D.dept_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	DE.emp_no,
	E.last_name || ', ' || E.first_name AS Full_Name,
	--E.last_name,
	--E.first_name,
	D.dept_name
FROM dept_emp DE
JOIN dept D
ON D.dept_no = DE.dept_no
JOIN emp E
ON E.emp_no = DE.emp_no
WHERE D.dept_name = 'Sales' or D.dept_name ='Development';


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	COUNT(last_name) AS Count_of_Name,
	last_name
FROM emp
GROUP BY last_name
ORDER BY Count_of_Name DESC;

--========================================================================================

--Query for the Bonus Exercise
SELECT T.title,
AVG(S.salary)
FROM titles T
JOIN salary S
ON T.emp_no = S.emp_no
GROUP BY T.title;

--Epilogue Query
SELECT * FROM emp WHERE emp_no=499942;

