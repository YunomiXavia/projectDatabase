use pm;
Go


    CREATE OR ALTER PROCEDURE GetDistinctEmployeesInProjectTeams
        @ProjectID INT
    AS
    BEGIN
        SET NOCOUNT ON;

        -- Check if the project exists
        IF NOT EXISTS (SELECT 1 FROM Project WHERE project_id = @ProjectID)
        BEGIN
            RAISERROR ('Project not found', 16, 1);
            RETURN;
        END

        -- Get distinct employees involved in the project's teams
        SELECT DISTINCT COUNT(e.employee_id) AS 'Total Employee'
        FROM Employee e
        INNER JOIN team_member tm ON e.employee_id = tm.member_id
        INNER JOIN team_project tp ON tm.team_id = tp.team_id
        WHERE tp.project_id = @ProjectID;
    END;

    Go
    EXEC GetDistinctEmployeesInProjectTeams 1;

    select * from team_member WHERE team_id = 1
    select * from team_member WHERE team_id = 2
    select * from team_member WHERE team_id = 4


    select * from team_project WHERE project_id = 1
