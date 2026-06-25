--1. Calculate how the Prompt Engineering Skill level in IA affects the GPA of the students.
SELECT 
  Prompt_Engineering_Skill,
  round(avg(Post_Semester_GPA - Pre_Semester_GPA), 2) as avg_difference_gpa,
  count (*) as number_of_students
FROM `project-85122fde-713f-4159-960.ia_impact.ia_full_data` 
group by Prompt_Engineering_Skill
order by avg_difference_gpa asc;

--2. Analyze the relationship between AI dependency and skill retention.
SELECT 
  case
    when Perceived_AI_Dependency between 1 and 4 then 'low'
    when Perceived_AI_Dependency between 5 and 6 then 'medium'
    when Perceived_AI_Dependency between 7 and 10 then 'high'
  end as IA_dependency,
  case  
    when Skill_Retention_Score >= 60 then 'positive' else 'negative'
    end as skill_retention,
  case 
    when Weekly_GenAI_Hours > Traditional_Study_Hours then 'High AI use'
    else 'Low AI use'
  end as more_usage_of_IA,
  count (*) as number_of_students
FROM `project-85122fde-713f-4159-960.ia_impact.ia_full_data` 
GROUP BY 
  skill_retention,
  IA_dependency,
  more_usage_of_IA
order by
  number_of_students desc;

-- 3. Calculate in which major category students have the highest increase in GPA including the AI.
SELECT 
  count (*) as number_of_students,
  Major_Category,
  round(avg(Post_Semester_GPA - Pre_Semester_GPA),2) as avg_difference_gpa,
  case
    when Perceived_AI_Dependency between 1 and 4 then 'low'
    when Perceived_AI_Dependency between 5 and 6 then 'medium'
    when Perceived_AI_Dependency between 7 and 10 then 'high'
  end as IA_dependency,
  case 
    when Weekly_GenAI_Hours > Traditional_Study_Hours then 'High AI use'
    else 'Low AI use'
  end as more_usage_of_IA,
FROM `project-85122fde-713f-4159-960.ia_impact.ia_full_data` 
GROUP BY 
  Major_Category,
  IA_dependency,
  more_usage_of_IA
ORDER BY avg_difference_gpa desc;

--4. See how the anxiety level during exams is affected by the dependency on IA.
SELECT 
  count (*) as number_of_students,
  Anxiety_Level_During_Exams,
  case
    when Perceived_AI_Dependency between 1 and 4 then 'low'
    when Perceived_AI_Dependency between 5 and 6 then 'medium'
    when Perceived_AI_Dependency between 7 and 10 then 'high'
  end as IA_dependency,
FROM `project-85122fde-713f-4159-960.ia_impact.ia_full_data` 
GROUP BY 
  IA_dependency,
  Anxiety_Level_During_Exams
  order by
    number_of_students desc;

--5. See how the burnout risk level is affected by the dependency on IA.
SELECT 
  count (*) as number_of_students,
  Burnout_Risk_Level,
  case
    when Perceived_AI_Dependency between 1 and 4 then 'low'
    when Perceived_AI_Dependency between 5 and 6 then 'medium'
    when Perceived_AI_Dependency between 7 and 10 then 'high'
  end as IA_dependency,
FROM `project-85122fde-713f-4159-960.ia_impact.ia_full_data` 
GROUP BY 
  IA_dependency,
  Burnout_Risk_Level
  order by
    number_of_students desc;

--6. Calculate the average weekly hours spent on IA and traditional study.
SELECT 
  round (avg(Weekly_GenAI_Hours),2) as avg_weekly_IA_hours,
  max (Weekly_GenAI_Hours) as max_weekly_IA_hours,
  round (avg(Traditional_Study_Hours),2) as avg_nonAI_weekly_hours,
  max (Traditional_Study_Hours) as max_nonAI_weekly_hours, 
FROM `project-85122fde-713f-4159-960.ia_impact.ia_full_data`