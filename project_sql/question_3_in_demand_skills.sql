/*
Question: What are the most in—demand skills for data analysts?
    —   Join job postings to inner join table similar to query 2
    —   Identify the top 5 in—demand skills for a data analyst.
    —   Focus on all job postings.
    —   Why? Retrieves the top 5 skills with the highest demand in
        providing insights into the most valuable skills for job
        the job seekers.
*/

SELECT 
    skills.skills AS skill_name,
    COUNT(skills.skill_id) AS demand_count
FROM job_postings_fact AS jobs 
JOIN skills_job_dim AS skills_to_job 
    ON jobs.job_id = skills_to_job.job_id
JOIN skills_dim AS skills 
    ON skills_to_job.skill_id = skills.skill_id
WHERE jobs.job_title_short = 'Data Analyst'
GROUP BY skills.skills
ORDER BY demand_count DESC
LIMIT 10;
