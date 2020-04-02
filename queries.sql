--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT Employee."Employee_No", Employee."Last_Name", Employee."First_Name", Employee."Gender", Salaries."Salary"
FROM Employee
JOIN Salaries ON Employee."Employee_No"= Salaries."Employee_No";

--2. List employees who were hired in 1986.
SELECT "First_Name", "Last_Name","Hire_Date"
FROM Employee
WHERE "Hire_Date" BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT Departments."Department_No", Departments."Department_Name", Employee."Employee_No", 
Employee."Last_Name",  Employee."First_Name", Department_Manager."From_Date", Department_Manager."To_Date"
FROM Departments
JOIN Department_Manager ON Departments."Department_No"= Department_Manager."Department_No" 
JOIN Employee ON Employee."Employee_No"= Department_Manager."Employee_No";

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Department_Employee."Employee_No", Employee."Last_Name", Employee."First_Name", Departments."Department_Name"
FROM Department_Employee
JOIN Employee ON Employee."Employee_No"= Department_Employee."Employee_No"
JOIN Departments ON Departments."Department_No"= Department_Employee."Department_No";

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT "First_Name", "Last_Name"
FROM Employee
WHERE "First_Name"= 'Hercules' AND  "Last_Name" LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Department_Employee."Employee_No", Employee."Last_Name", Employee."First_Name", Departments."Department_Name"
FROM Department_Employee
JOIN Employee ON Employee."Employee_No"= Department_Employee."Employee_No"
JOIN Departments ON Departments."Department_No"= Department_Employee."Department_No"
WHERE "Department_Name" = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Department_Employee."Employee_No", Employee."Last_Name", Employee."First_Name", Departments."Department_Name"
FROM Department_Employee
JOIN Employee ON Employee."Employee_No"= Department_Employee."Employee_No"
JOIN Departments ON Departments."Department_No"= Department_Employee."Department_No"
WHERE "Department_Name" = 'Sales' OR  "Department_Name" ='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT "Last_Name", COUNT("Last_Name") AS "Frequency Count"
FROM Employee
GROUP BY "Last_Name" 
ORDER BY "Frequency Count" DESC;



