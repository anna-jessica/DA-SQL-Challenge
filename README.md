### Employee Data Analytics
Last updated January 2026
Data Analytics Bootcamp - SQL Assignment

This project explores a historical employee dataset for a global corporation. Using PostgreSQL, I designed a relational database, loaded raw CSV files, and wrote SQL queries to answer business questions about employees, departments, salaries, and management structure.
The project demonstrates skills in:
-data modeling
-database schema design
-data cleaning and loading
-analytical SQL querying

#### Data Modeling

Inspected the CSVs and sketched out an ERD of the tables.

#### Data Engineering

* Created a table schema for each of the six CSV files.

* Imported each CSV file into the corresponding SQL table.

#### Data Analysis - questions answered

1. List the following details of each employee: employee number, last name, first name, gender, and salary.

2. List employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List all employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

###Updates:

- **January 2026:** Renamed tables and columns to follow modern PostgreSQL best practices (lowercase `snake_case` identifiers).
- **January 2026:** Added two new queries:
  - average salary by department
  - top 10 highest salaries
