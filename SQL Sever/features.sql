use pm;
Go

CREATE OR ALTER TRIGGER delete_role_actions
ON Role
INSTEAD OF DELETE 
AS
BEGIN
    DECLARE @deleted_role_id INT;

    SELECT @deleted_role_id = role_id FROM deleted;

    -- 1. Remove associated role assignments (team_member or similar)
    DELETE FROM team_member 
    WHERE role_id = @deleted_role_id;  

    DELETE FROM Role 
    WHERE role_id = @deleted_role_id;  
END;
GO

DELETE FROM Role WHERE role_id = 3
select * from Role
select * from team_member