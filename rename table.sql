--rename tables
ALTER TABLE "Departments"          RENAME TO departments;
ALTER TABLE "Department_Manager"   RENAME TO department_manager;
ALTER TABLE "Department_Employee"  RENAME TO department_employee;
ALTER TABLE "Employee"             RENAME TO employee;
ALTER TABLE "Titles"               RENAME TO titles;
ALTER TABLE "Salaries"             RENAME TO salaries;

--rename columns

-- departments
ALTER TABLE departments
    RENAME COLUMN "Department_No"   TO department_no;
ALTER TABLE departments
    RENAME COLUMN "Department_Name" TO department_name;

-- department_manager
ALTER TABLE department_manager
    RENAME COLUMN "Department_No" TO department_no;
ALTER TABLE department_manager
    RENAME COLUMN "Employee_No"   TO employee_no;
ALTER TABLE department_manager
    RENAME COLUMN "From_Date"     TO from_date;
ALTER TABLE department_manager
    RENAME COLUMN "To_Date"       TO to_date;

-- department_employee
ALTER TABLE department_employee
    RENAME COLUMN "Employee_No"   TO employee_no;
ALTER TABLE department_employee
    RENAME COLUMN "Department_No" TO department_no;
ALTER TABLE department_employee
    RENAME COLUMN "From_Date"     TO from_date;
ALTER TABLE department_employee
    RENAME COLUMN "To_Date"       TO to_date;

-- employee
ALTER TABLE employee
    RENAME COLUMN "Employee_No" TO employee_no;
ALTER TABLE employee
    RENAME COLUMN "Birthday"    TO birthday;
ALTER TABLE employee
    RENAME COLUMN "First_Name"  TO first_name;
ALTER TABLE employee
    RENAME COLUMN "Last_Name"   TO last_name;
ALTER TABLE employee
    RENAME COLUMN "Gender"      TO gender;
ALTER TABLE employee
    RENAME COLUMN "Hire_Date"   TO hire_date;

-- titles
ALTER TABLE titles
    RENAME COLUMN "Employee_No" TO employee_no;
ALTER TABLE titles
    RENAME COLUMN "Title"       TO title;
ALTER TABLE titles
    RENAME COLUMN "From_Date"   TO from_date;
ALTER TABLE titles
    RENAME COLUMN "To_Date"     TO to_date;

-- salaries
ALTER TABLE salaries
    RENAME COLUMN "Employee_No" TO employee_no;
ALTER TABLE salaries
    RENAME COLUMN "Salary"      TO salary;
ALTER TABLE salaries
    RENAME COLUMN "From_Date"   TO from_date;
ALTER TABLE salaries
    RENAME COLUMN "To_Date"     TO to_date;
