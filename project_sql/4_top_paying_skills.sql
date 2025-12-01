SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25

/*
1. 🤝 Focus on Hybridization (DE/DevOps):
The highest salaries are commanded by skills outside traditional analytics, 
focusing on DevOps/Infrastructure (Terraform, Ansible, VMware) and Data Engineering/MLOps (Kafka, Airflow). 
This indicates a premium for Data Analysts who can own the environment.

2. 🧠 Demand for Advanced ML/AI: There is high compensation for specialized 
machine learning frameworks (PyTorch, TensorFlow, Hugging Face) and 
advanced backend languages (Golang, Scala), 
pushing the Data Analyst role toward specialized ML/Data Scientist functions.

3. 💰 Value in Scale and Specialization: High-paying skills 
are primarily niche (Solidity, Couchbase) or enable complex, 
large-scale data processing (Kafka, Airflow), rather than foundational analytical tools. 
Proficiency in managing complex data systems drives the highest salaries.

[
  {
    "skills": "svn",
    "average_salary": "400000"
  },
  {
    "skills": "solidity",
    "average_salary": "179000"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "golang",
    "average_salary": "155000"
  },
  {
    "skills": "mxnet",
    "average_salary": "149000"
  },
  {
    "skills": "dplyr",
    "average_salary": "147633"
  },
  {
    "skills": "vmware",
    "average_salary": "147500"
  },
  {
    "skills": "terraform",
    "average_salary": "146734"
  },
  {
    "skills": "twilio",
    "average_salary": "138500"
  },
  {
    "skills": "gitlab",
    "average_salary": "134126"
  },
  {
    "skills": "kafka",
    "average_salary": "129999"
  },
  {
    "skills": "puppet",
    "average_salary": "129820"
  },
  {
    "skills": "keras",
    "average_salary": "127013"
  },
  {
    "skills": "pytorch",
    "average_salary": "125226"
  },
  {
    "skills": "perl",
    "average_salary": "124686"
  },
  {
    "skills": "ansible",
    "average_salary": "124370"
  },
  {
    "skills": "hugging face",
    "average_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "average_salary": "120647"
  },
  {
    "skills": "cassandra",
    "average_salary": "118407"
  },
  {
    "skills": "notion",
    "average_salary": "118092"
  },
  {
    "skills": "atlassian",
    "average_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "average_salary": "116712"
  },
  {
    "skills": "airflow",
    "average_salary": "116387"
  },
  {
    "skills": "scala",
    "average_salary": "115480"
  }
]
*/