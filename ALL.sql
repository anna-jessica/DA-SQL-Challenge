CREATE TABLE Departments (
    "Department_No" VARCHAR   NOT NULL,
    "Department_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_No"
     )
);

CREATE TABLE Department_Manager (
    "Department_No" VARCHAR   NOT NULL,
    "Employee_No" INTEGER   NOT NULL,
    "From_Date" DATE  NOT NULL,
    "To_Date" DATE  NOT NULL
);

CREATE TABLE Department_Employee (
    "Employee_No" INTEGER   NOT NULL,
    "Department_No" VARCHAR   NOT NULL,
    "From_Date" DATE   NOT NULL,
    "To_Date" DATE   NOT NULL
);

CREATE TABLE Employee (
    "Employee_No" INTEGER   NOT NULL,
    "Birthday" DATE NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Gender" VARCHAR   NOT NULL,
    "Hire_Date" DATE   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "Employee_No"
     )
);

CREATE TABLE Titles (
    "Employee_No" INTEGER   NOT NULL,
    "Title" VARCHAR   NOT NULL,
    "From_Date" DATE  NOT NULL,
    "To_Date" DATE  NOT NULL
);

CREATE TABLE Salaries (
    "Employee_No" INTEGER   NOT NULL,
    "Salary" INTEGER   NOT NULL,
    "From_Date" DATE  NOT NULL,
    "To_Date" DATE  NOT NULL
);

ALTER TABLE Department_Manager ADD CONSTRAINT "fk_Department_Manager_Department_No" FOREIGN KEY("Department_No")
REFERENCES Departments ("Department_No");

ALTER TABLE Department_Manager ADD CONSTRAINT "fk_Department_Manager_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES Employee ("Employee_No");

ALTER TABLE Department_Employee ADD CONSTRAINT "fk_Department_Employee_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES Employee ("Employee_No");

ALTER TABLE Department_Employee ADD CONSTRAINT "fk_Department_Employee_Department_No" FOREIGN KEY("Department_No")
REFERENCES Departments ("Department_No");

ALTER TABLE Titles ADD CONSTRAINT "fk_Titles_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES Employee ("Employee_No");

ALTER TABLE Salaries ADD CONSTRAINT "fk_Salaries_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES Employee ("Employee_No");

SELECT* FROM Departments;
SELECT* FROM Department_Manager;
SELECT* FROM Department_Employee;
SELECT* FROM Employee;
SELECT* FROM Titles;
SELECT* FROM Salaries;

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



