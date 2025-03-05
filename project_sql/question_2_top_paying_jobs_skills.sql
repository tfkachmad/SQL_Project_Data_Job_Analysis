/*
 Question: What are the skills required for these top-paying roles?
 -   Identify the key skills required for the highest-paying remote Data Analyst roles.
 -   Focus on skills listed in job postings for these roles.
 -   Why? Understanding the most in-demand skills helps job seekers upskill effectively and 
 align with high-paying opportunities.
 */
WITH top_paying_jobs AS (
    SELECT 
        job_id
    FROM job_postings_fact AS jobs
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    skills.skills AS skill_name,
    COUNT(*) AS skill_count
FROM top_paying_jobs AS jobs
JOIN skills_job_dim AS skills_to_job 
    ON jobs.job_id = skills_to_job.job_id
JOIN skills_dim AS skills 
    ON skills_to_job.skill_id = skills.skill_id
GROUP BY skills.skills
ORDER BY skill_count DESC, 
         skill_name
LIMIT 10;
