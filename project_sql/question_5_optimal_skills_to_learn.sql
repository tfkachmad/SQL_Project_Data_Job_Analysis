/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high—paying skill)?
    —   Identify skills in high demand and associated with high average salaries for Data Analyst roles
    —   Concentrates on remote positions with specified salaries
    —   Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
        offering strategic insights for career development in data analysis
*/

-- Optimal skills, sorted by the most in-demand first
SELECT 
    skills.skill_id,
    skills.skills AS skill_name,
    COUNT(skills.skill_id) AS demand_count,
    ROUND(AVG(jobs.salary_year_avg), 0) AS annual_salary_avg_usd
FROM job_postings_fact AS jobs 
JOIN skills_job_dim AS skills_to_job 
    ON jobs.job_id = skills_to_job.job_id
JOIN skills_dim AS skills 
    ON skills_to_job.skill_id = skills.skill_id
WHERE jobs.job_title_short = 'Data Analyst'
    AND jobs.salary_year_avg IS NOT NULL
GROUP BY skills.skill_id, skill_name
HAVING COUNT(skills.skill_id) > 100
ORDER BY demand_count DESC;


-- Optimal skills, sorted by the top-paying first
SELECT 
    skills.skill_id,
    skills.skills AS skill_name,
    COUNT(skills.skill_id) AS demand_count,
    ROUND(AVG(jobs.salary_year_avg), 0) AS annual_salary_avg_usd
FROM job_postings_fact AS jobs 
JOIN skills_job_dim AS skills_to_job 
    ON jobs.job_id = skills_to_job.job_id
JOIN skills_dim AS skills 
    ON skills_to_job.skill_id = skills.skill_id
WHERE jobs.job_title_short = 'Data Analyst'
    AND jobs.salary_year_avg IS NOT NULL
GROUP BY skills.skill_id, skill_name
HAVING COUNT(skills.skill_id) > 100
ORDER BY annual_salary_avg_usd DESC;
