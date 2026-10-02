USE stores;

-- ============================================================
-- CASE STATEMENT PRACTICE
-- ============================================================


-- ============================================================
-- 1. VIEW EMPLOYEE DATA
-- ============================================================

SELECT *
FROM employees;


-- ============================================================
-- 2. SALARY CATEGORY
-- ============================================================

SELECT
    emp_id,
    emp_name,
    salary,
    department,
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_stage
FROM employees;


-- ============================================================
-- 3. PERFORMANCE RATING
-- ============================================================

SELECT
    emp_id,
    emp_name,
    department,
    performance_rating,
    CASE
        WHEN performance_rating = 5 THEN 'Excellent'
        WHEN performance_rating = 4 THEN 'Good'
        WHEN performance_rating = 3 THEN 'Average'
        ELSE 'Poor'
    END AS rating
FROM employees;


-- ============================================================
-- 4. EXPERIENCE LEVEL
-- ============================================================

SELECT
    emp_id,
    emp_name,
    department,
    experience,
    CASE
        WHEN experience >= 7 THEN 'Senior'
        WHEN experience >= 3 THEN 'Mid Level'
        ELSE 'Fresher'
    END AS position
FROM employees;


-- ============================================================
-- 5. FIXED BONUS AMOUNT
-- ============================================================

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    CASE
        WHEN salary >= 70000 THEN 15
        WHEN salary >= 50000 THEN 10
        ELSE 5
    END AS bonus_percentage
FROM employees;


-- ============================================================
-- 6. BONUS AMOUNT
-- ============================================================

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    CASE
        WHEN salary >= 70000 THEN salary * 0.15
        WHEN salary >= 50000 THEN salary * 0.10
        ELSE salary * 0.05
    END AS bonus_amount
FROM employees;


-- ============================================================
-- 7. DEPARTMENT CLASSIFICATION
-- ============================================================

SELECT
    emp_id,
    emp_name,
    department,
    CASE
        WHEN department = 'IT' THEN 'Technical'
        WHEN department = 'HR' THEN 'Human Resources'
        WHEN department = 'Finance' THEN 'Financial'
        WHEN department = 'Sales' THEN 'Business'
        ELSE 'Other'
    END AS department_classification
FROM employees;


-- ============================================================
-- 8. ELIGIBILITY
-- ============================================================

SELECT
    emp_id,
    emp_name,
    experience,
    performance_rating,
    CASE
        WHEN experience >= 7
             AND performance_rating >= 4
        THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility
FROM employees;


-- ============================================================
-- 9. EMPLOYEE PERFORMANCE STAGE
-- ============================================================

SELECT
    emp_id,
    emp_name,
    department,
    experience,
    performance_rating,
    CASE
        WHEN experience >= 7
             AND performance_rating = 5
        THEN 'Top Performer'

        WHEN experience >= 5
        THEN 'Experienced'

        WHEN experience >= 4
        THEN 'Good Performer'

        ELSE 'Needs Improvement'
    END AS performance_stage
FROM employees;


-- ============================================================
-- 10. EMPLOYEE STATUS
-- ============================================================

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS employee_status
FROM employees
WHERE salary >= 70000;


-- ============================================================
-- 11. SORT USING CASE
-- ============================================================

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS employee_status
FROM employees
ORDER BY
    CASE
        WHEN salary >= 70000 THEN 1
        WHEN salary >= 50000 THEN 2
        ELSE 3
    END;


-- ============================================================
-- 12. COUNT EMPLOYEES BY SALARY CATEGORY
-- ============================================================

SELECT
    SUM(CASE
        WHEN salary >= 70000 THEN 1
        ELSE 0
    END) AS high_salary,

    SUM(CASE
        WHEN salary >= 50000
             AND salary < 70000
        THEN 1
        ELSE 0
    END) AS medium_salary,

    SUM(CASE
        WHEN salary < 50000 THEN 1
        ELSE 0
    END) AS low_salary

FROM employees;


-- ============================================================
-- 13. HIGH-SALARY EMPLOYEES BY DEPARTMENT
-- ============================================================

SELECT
    department,
    SUM(CASE
        WHEN salary >= 60000 THEN 1
        ELSE 0
    END) AS high_salary_employees
FROM employees
GROUP BY department;


-- ============================================================
-- 14. DEPARTMENT AVERAGE SALARY CATEGORY
-- ============================================================

SELECT
    department,
    AVG(salary) AS average_salary,
    CASE
        WHEN AVG(salary) >= 65000 THEN 'High Salary'
        WHEN AVG(salary) >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS department_salary
FROM employees
GROUP BY department;


-- ============================================================
-- 15. EMPLOYEES WITH RATING 4 OR ABOVE BY DEPARTMENT
-- ============================================================

SELECT
    department,
    SUM(CASE
        WHEN performance_rating >= 4 THEN 1
        ELSE 0
    END) AS good_rating_employees
FROM employees
GROUP BY department;


-- ============================================================
-- 16. SALARY INCREMENT BASED ON PERFORMANCE
-- ============================================================

SELECT
    emp_id,
    emp_name,
    performance_rating,
    salary,
    salary +
    CASE
        WHEN performance_rating = 5 THEN salary * 0.20
        WHEN performance_rating = 4 THEN salary * 0.15
        WHEN performance_rating = 3 THEN salary * 0.10
        ELSE salary * 0.05
    END AS new_salary
FROM employees;