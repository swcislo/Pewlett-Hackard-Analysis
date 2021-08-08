SELECT
	e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
    t.title
INTO mentorship_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
ORDER BY
	emp_no ASC,
	from_date DESC;

SELECT * FROM mentorship_titles

SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	birth_date,
	title
INTO mentorship_unique_titles
FROM mentorship_titles
ORDER BY emp_no ASC;

SELECT * FROM dept_emp

SELECT	mut.emp_no,
		mut.first_name,
		mut.last_name,
		mut.birth_date,
		mut.title,
		de.from_date,
		de.to_date	
INTO mentorship_group
FROM mentorship_unique_titles as mut
LEFT OUTER JOIN dept_emp as de ON (mut.emp_no = de.emp_no);

SELECT * FROM mentorship_group

SELECT	emp_no,
		first_name,
		last_name,
		birth_date,
		title,
		from_date,
		to_date
INTO mentorship_eligibility
FROM mentorship_group
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (to_date = '9999-01-01')
ORDER BY emp_no ASC


SELECT * FROM mentorship_eligibility
ORDER BY emp_no ASC
