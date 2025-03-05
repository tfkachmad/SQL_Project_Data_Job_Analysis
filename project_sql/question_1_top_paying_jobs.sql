/*
Question: What are the top paying jobs for Data Analyst that are available remotely
    -   Identify the top 10 highest-paying Data Analyst roles that are available remotely.
    -   Focuses on jobs with specified salaries (remove NULLs)
    -   Why? Highlight the top-paying opportunities for Data Analyst, offering insights into 
        high-paying career paths in the field. 
        This helps professionals and job seekers make informed decisions about remote work opportunities, 
        salary expectations, and potential career growth.
*/

SELECT 
    jobs.job_id,
    company.company_id,
    company.name AS company_name,
    jobs.job_title,
    jobs.job_location,
    jobs.job_via,
    jobs.job_schedule_type,
    jobs.job_posted_date::DATE,
    jobs.salary_year_avg
FROM job_postings_fact AS jobs
LEFT JOIN company_dim AS company 
    ON jobs.company_id = company.company_id
WHERE jobs.job_title_short = 'Data Analyst'
    AND jobs.job_location = 'Anywhere'
    AND jobs.salary_year_avg IS NOT NULL
ORDER BY jobs.salary_year_avg DESC
LIMIT 10;


SELECT 
    jobs.job_id,
    company.company_id,
    company.name AS company_name,
    jobs.job_title,
    jobs.job_location,
    jobs.job_via,
    jobs.job_schedule_type,
    jobs.job_posted_date::DATE,
    jobs.salary_year_avg
FROM job_postings_fact AS jobs
LEFT JOIN company_dim AS company 
    ON jobs.company_id = company.company_id
WHERE jobs.job_title_short = 'Data Analyst'
    AND jobs.job_location = 'Anywhere'
    AND jobs.salary_year_avg IS NOT NULL
ORDER BY jobs.salary_year_avg DESC
LIMIT 10;