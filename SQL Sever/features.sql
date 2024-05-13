use pm;
GO


CREATE OR ALTER PROCEDURE display_employees_by_team_skill
    @team_id INT -- Parameter to specify the desired team's ID
AS
BEGIN
    SELECT e.first_name, e.last_name, e.email, s.skill_name -- Select relevant employee and skill data
    FROM Employee e
    JOIN employee_skills es ON e.employee_id = es.employee_id -- Join with employee skills
    JOIN team_skill_tag tst ON es.skill_id = tst.skill_id -- Join with team skill associations
    JOIN Skills s ON es.skill_id = s.skill_id -- Join with the skills table
    JOIN Team t ON tst.team_id = t.team_id -- Join with the teams table
    WHERE t.team_id = @team_id; -- Filter for employees matching the team's skills
END;
GO

EXEC display_employees_by_team_skill @team_id = 1; -- Execute the procedure with team_id = 1
-- SELECT * from Team; -- Display the list of teams

select * from team_skill_tag

-- EXEC ViewCountDistinctEmployeesInProjectTeams 1;
-- EXEC CountDistinctEmployeesInProjectTeams @ProjectID = 1;

-- select * from team_member WHERE team_id = 1
-- select * from team_member WHERE team_id = 2
-- select * from team_member WHERE team_id = 4
-- select * from team_project WHERE project_id = 1

-- EXEC CountDistinctEmployeesInProjectTeams 1;


-- select * from team_member WHERE team_id = 1
-- select * from team_member WHERE team_id = 2
-- select * from team_member WHERE team_id = 4
-- select * from team_project WHERE project_id = 1

-- DELETE FROM team_member WHERE role_id = 4 AND member_id = 5 AND team_id = 2


