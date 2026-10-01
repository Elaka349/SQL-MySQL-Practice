
-- ============================================================
-- 1. DATABASE SETUP
-- ============================================================

DROP DATABASE IF EXISTS window_practice;

CREATE DATABASE window_practice;

USE window_practice;


-- ============================================================
-- 2. CREATE TABLE
-- ============================================================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    job_role VARCHAR(50),
    salary INT,
    joining_date DATE,
    performance_score DECIMAL(4,2)
);


-- ============================================================
-- 3. INSERT SAMPLE DATA
-- ============================================================

INSERT INTO employees
(emp_id, emp_name, department, job_role, salary, joining_date, performance_score)
VALUES
(101, 'Arun',    'IT',      'Developer',    60000, '2022-01-15', 8.50),
(102, 'Priya',   'IT',      'Developer',    75000, '2021-06-10', 9.20),
(103, 'Karthik', 'IT',      'Tester',       55000, '2023-03-20', 7.80),
(104, 'Dhivya',  'HR',      'HR Executive', 50000, '2022-08-12', 8.00),
(105, 'Rahul',   'IT',      'Developer',    70000, '2020-11-05', 8.90),
(106, 'Sneha',   'HR',      'Recruiter',    45000, '2023-01-18', 7.50),
(107, 'Vijay',   'Finance', 'Accountant',   65000, '2021-04-25', 8.70),
(108, 'Meena',   'Finance', 'Analyst',      58000, '2022-09-14', 8.10),
(109, 'Suresh',  'IT',      'Tester',       55000, '2024-02-10', 7.90),
(110, 'Anitha',  'HR',      'HR Executive', 52000, '2020-05-19', 9.00),
(111, 'Dinesh',  'Finance', 'Accountant',   65000, '2023-07-11', 8.30),
(112, 'Kavya',   'IT',      'Developer',    80000, '2019-12-01', 9.50),
(113, 'Mohan',   'Finance', 'Analyst',      58000, '2024-01-08', 7.70),
(114, 'Divya',   'HR',      'Recruiter',    45000, '2022-03-16', 8.20),
(115, 'Ajay',    'IT',      'Developer',    70000, '2021-10-22', 8.60);


-- ============================================================
-- 4. VIEW ORIGINAL DATA
-- ============================================================

SELECT *
FROM employees;


-- ============================================================
-- 5. ROW_NUMBER()
-- ============================================================

-- 5.1 Assign a unique number to every employee
-- based on salary from highest to lowest.

SELECT
    emp_id,
    emp_name,
    department,
    job_role,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS salary_row_number
FROM employees;


-- 5.2 Assign row numbers separately within each department.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_row_number
FROM employees;


-- ============================================================
-- 6. RANK()
-- ============================================================

-- 6.1 Rank employees based on salary.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- 6.2 Rank employees separately within each department.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- ============================================================
-- 7. DENSE_RANK()
-- ============================================================

-- 7.1 Dense rank based on salary.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_dense_rank
FROM employees;


-- 7.2 Dense rank within each department.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_salary_rank
FROM employees;


-- ============================================================
-- 8. NTILE()
-- ============================================================

-- 8.1 Divide all employees into 4 salary groups.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    NTILE(4) OVER (
        ORDER BY salary DESC
    ) AS salary_group
FROM employees;


-- 8.2 Divide employees into 3 groups within each department.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    NTILE(3) OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_group
FROM employees;


-- ============================================================
-- 9. LAG()
-- ============================================================

-- 9.1 Display the previous employee's salary.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    LAG(salary) OVER (
        ORDER BY salary
    ) AS previous_salary
FROM employees;


-- 9.2 Calculate salary difference from the previous row.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    LAG(salary) OVER (
        ORDER BY salary
    ) AS previous_salary,
    salary - LAG(salary) OVER (
        ORDER BY salary
    ) AS salary_difference
FROM employees;


-- 9.3 Compare salary with the previous employee
-- within the same department.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    LAG(salary) OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS previous_salary
FROM employees;


-- ============================================================
-- 10. LEAD()
-- ============================================================

-- 10.1 Display the next employee's salary.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    LEAD(salary) OVER (
        ORDER BY salary DESC
    ) AS next_salary
FROM employees;


-- 10.2 Calculate the difference between current
-- salary and the next salary.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    LEAD(salary) OVER (
        ORDER BY salary DESC
    ) AS next_salary,
    salary - LEAD(salary) OVER (
        ORDER BY salary DESC
    ) AS salary_difference
FROM employees;


-- ============================================================
-- 11. SUM() WINDOW FUNCTION
-- ============================================================

-- 11.1 Display total salary of all employees
-- alongside every employee.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    SUM(salary) OVER () AS total_salary
FROM employees;


-- 11.2 Calculate running salary based on joining date.

SELECT
    emp_id,
    emp_name,
    department,
    joining_date,
    salary,
    SUM(salary) OVER (
        ORDER BY joining_date
    ) AS running_salary
FROM employees;


-- 11.3 Calculate department-wise running salary.

SELECT
    emp_id,
    emp_name,
    department,
    joining_date,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY joining_date
    ) AS department_running_salary
FROM employees;


-- ============================================================
-- 12. AVG() WINDOW FUNCTION
-- ============================================================

-- 12.1 Display overall average salary.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    AVG(salary) OVER () AS average_salary
FROM employees;


-- 12.2 Display department-wise average salary.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average_salary
FROM employees;


-- ============================================================
-- 13. EMPLOYEES EARNING ABOVE DEPARTMENT AVERAGE
-- ============================================================

SELECT *
FROM (
    SELECT
        emp_id,
        emp_name,
        department,
        salary,
        AVG(salary) OVER (
            PARTITION BY department
        ) AS department_average_salary
    FROM employees
) AS x
WHERE salary > department_average_salary;


-- ============================================================
-- 14. MAX() WINDOW FUNCTION
-- ============================================================

-- Display the highest salary in each department.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    MAX(salary) OVER (
        PARTITION BY department
    ) AS maximum_department_salary
FROM employees;


-- ============================================================
-- 15. MIN() WINDOW FUNCTION
-- ============================================================

-- Display the lowest salary in each department.

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    MIN(salary) OVER (
        PARTITION BY department
    ) AS minimum_department_salary
FROM employees;


-- ============================================================
-- 16. HIGHEST-PAID EMPLOYEE IN EACH DEPARTMENT
-- ============================================================

SELECT *
FROM (
    SELECT
        emp_id,
        emp_name,
        department,
        salary,
        RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) AS x
WHERE salary_rank = 1;


-- ============================================================
-- 17. SECOND-HIGHEST SALARY IN EACH DEPARTMENT
-- ============================================================

SELECT *
FROM (
    SELECT
        emp_id,
        emp_name,
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) AS x
WHERE salary_rank = 2;


-- ============================================================
-- 18. TOP 2 EMPLOYEES FROM EACH DEPARTMENT
-- ============================================================

SELECT *
FROM (
    SELECT
        emp_id,
        emp_name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) AS x
WHERE salary_rank <= 2;


