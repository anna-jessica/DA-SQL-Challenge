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



