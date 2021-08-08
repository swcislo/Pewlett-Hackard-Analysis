-- Combine employee and title tables
SELECT
	e.emp_no,
    e.first_name,
	e.last_name,
    t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY
	emp_no ASC,
	from_date DESC;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC;

-- Create table for retiring titles
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC
