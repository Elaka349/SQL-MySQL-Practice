-- ============================================================
-- 16. FIRST_VALUE()
-- ============================================================

-- 16.1 Find the highest salary among all employees.

SELECT
    e_id,
    e_name,
    dept,
    salary,
    FIRST_VALUE(salary) OVER (
        ORDER BY salary DESC
    ) AS highest_salary
FROM employees;


-- 16.2 Find the highest salary within each department.

SELECT
    e_id,
    e_name,
    dept,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS department_highest_salary
FROM employees;


-- ============================================================
-- 17. LAST_VALUE()
-- ============================================================

-- 17.1 Find the lowest salary among all employees.

SELECT
    e_id,
    e_name,
    dept,
    salary,
    LAST_VALUE(salary) OVER (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS lowest_salary
FROM employees;


-- 17.2 Find the lowest salary within each department.

SELECT
    e_id,
    e_name,
    dept,
    salary,
    LAST_VALUE(salary) OVER (
        PARTITION BY dept
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS department_lowest_salary
FROM employees;


-- ============================================================
-- 18. NTH_VALUE()
-- ============================================================

-- 18.1 Find the second-highest salary among all employees.

SELECT
    e_id,
    e_name,
    dept,
    salary,
    NTH_VALUE(salary, 2) OVER (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS second_highest_salary
FROM employees;


-- 18.2 Find the second-highest salary within each department.

SELECT
    e_id,
    e_name,
    dept,
    salary,
    NTH_VALUE(salary, 2) OVER (
        PARTITION BY dept
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS department_second_highest_salary
FROM employees;