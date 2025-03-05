/*
Question: What are the top skills based on salary?
    -   Look at the average salary associated with each skill for Data Analyst positions
    -   Focuses on roles with specified salaries, regardless of location
    -   Why? It reveals how different skills impact salary levels for Data Analysts and helps identify
    the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills.skills AS skill_name,
    ROUND(AVG(jobs.salary_year_avg), 0) AS salary_year_avg
FROM job_postings_fact AS jobs 
JOIN skills_job_dim AS skills_to_job 
    ON jobs.job_id = skills_to_job.job_id
JOIN skills_dim AS skills 
    ON skills_to_job.skill_id = skills.skill_id
WHERE jobs.job_title_short = 'Data Analyst'
    AND jobs.salary_year_avg IS NOT NULL
GROUP BY skills.skills
ORDER BY salary_year_avg DESC
LIMIT 20;
