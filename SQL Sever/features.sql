use pm;



-- note: trigger to increase employee number of a project when a new employee is added to the project, and decrease when an employee is removed from the project

-- View all employees that have the selected skill id

-- SELECT * from Team

-- select * from Role
-- select * from team_member
-- can you create a procedure to list out all the employee basic info like 

-- query to select all the employees that have the selected skill id


-- Create procedure to list all employees with a selected skill id
GO


-- EXEC DisplayTeamsByProjectPreference @ProjectID = 91; -- Replace 1 with the desired project ID

-- GO

-- ["Mobile Development", "QA", "Backend Development"]
-- select * from Project

-- SELECT *
-- FROM Team t
-- WHERE t.team_name LIKE '%Web Development%, %Backend Development%';

-- Delete all tables in the pm database

SELECT * from team_member
-- select * from employee_skills


