WITH skill_counts AS 
    (
        SELECT
            t1.skill_id,
            count(*) AS skill_count
        FROM
            skills_job_dim AS t1
        GROUP BY
            t1.skill_id
    )
SELECT
    t2.skills,
    skill_counts.skill_count
FROM skill_counts
LEFT JOIN skills_dim AS t2
    ON skill_counts.skill_id = t2.skill_id
ORDER BY
    skill_counts.skill_count DESC
limit 5;

SELECT
    company_dim.name as company_name,
    count(job_postings_fact.job_id) as job_count,
    CASE
        WHEN count(job_postings_fact.job_id) < 10 THEN 'Small'
        WHEN count(job_postings_fact.job_id) BETWEEN 10 AND 50 THEN 'Medium'
        WHEN count(job_postings_fact.job_id) > 50 THEN 'Large'
    END AS company_size
FROM
    job_postings_fact
JOIN
    company_dim
    ON job_postings_fact.company_id = company_dim.company_id
GROUP BY
    company_dim.name

WITH company_job_counts AS 
    (    
    SELECT
        t1.company_id,
        count(job_id) AS job_count
    FROM
        job_postings_fact AS t1
    GROUP BY
        t1.company_id
    )

SELECT
    t2.name AS company_name,
    t1.job_count,
    CASE
        WHEN t1.job_count < 10 THEN 'Small'
        WHEN t1.job_count BETWEEN 10 AND 50 THEN 'Medium'
        WHEN t1.job_count > 50 THEN 'Large'
    END AS company_size
FROM company_job_counts AS t1
LEFT JOIN company_dim AS t2
    ON t1.company_id = t2.company_id