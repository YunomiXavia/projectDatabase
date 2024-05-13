use pm;
GO

CREATE OR ALTER PROCEDURE CountDistinctEmployeesInProjectTeams
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Count INT;  -- Changed to INT to match number_of_employees data type
    -- Check if the project exists
    IF NOT EXISTS (SELECT 1 FROM Project WHERE project_id = @ProjectID)
    BEGIN
        RAISERROR ('Project not found', 16, 1);
        RETURN;
    END

    -- Get distinct employees involved in the project's teams
    SELECT DISTINCT @Count = COUNT(e.employee_id) 
    FROM Employee e
    INNER JOIN team_member tm ON e.employee_id = tm.member_id
    INNER JOIN team_project tp ON tm.team_id = tp.team_id
    WHERE tp.project_id = @ProjectID;

    -- Update the number_of_employees in the Project table
    UPDATE Project
    SET number_of_employees = @Count
    WHERE project_id = @ProjectID;
END;
Go

-- EXEC ViewCountDistinctEmployeesInProjectTeams 1;
-- EXEC CountDistinctEmployeesInProjectTeams @ProjectID = 1;

select * from team_member WHERE team_id = 1
select * from team_member WHERE team_id = 2
select * from team_member WHERE team_id = 4
select * from team_project WHERE project_id = 1

EXEC CountDistinctEmployeesInProjectTeams 1;


-- select * from team_member WHERE team_id = 1
-- select * from team_member WHERE team_id = 2
-- select * from team_member WHERE team_id = 4
-- select * from team_project WHERE project_id = 1

-- DELETE FROM team_member WHERE role_id = 4 AND member_id = 5 AND team_id = 2


