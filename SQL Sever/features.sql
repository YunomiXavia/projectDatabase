use pm;



-- note: trigger to increase employee number of a project when a new employee is added to the project, and decrease when an employee is removed from the project

-- View all employees that have the selected skill id

-- SELECT * from Team

-- select * from Role
-- select * from team_member
-- can you create a procedure to list out all the employee basic info like 

-- query to select all the employees that have the selected skill id


-- Create procedure to list all employees with a selected skill id


-- EXEC DisplayTeamsByProjectPreference @ProjectID = 91; -- Replace 1 with the desired project ID

-- GO

-- ["Mobile Development", "QA", "Backend Development"]
-- select * from Project

-- SELECT *
-- FROM Team t
-- WHERE t.team_name LIKE '%Web Development%, %Backend Development%';

-- Delete all tables in the pm database
-- select * from team_member

-- select * from Team
-- select * from SKills

-- SELECT * from team_skill_tag

SELECT 
    e.first_name, e.last_name, e.email, 
    COALESCE(p.name, 'Not Join') AS project_name, 
    COALESCE(t.team_name, 'Not Join') AS team_name, 
    COALESCE(s.skill_name, 'Not Join') AS skill_name 
FROM Employee e 
LEFT JOIN Project p ON pa.project_id = p.project_id 
LEFT JOIN team_member tm ON e.employee_id = tm.member_id 
LEFT JOIN Team t ON tm.team_id = t.team_id 
LEFT JOIN employee_skills es ON e.employee_id = es.employee_id 
LEFT JOIN Skills s ON es.skill_id = s.skill_id;



