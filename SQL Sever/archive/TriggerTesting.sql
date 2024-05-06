use pm;
Go

-- ! Delete Skills Trigger Testing Code (don't delete) 
CREATE OR ALTER TRIGGER cascade_delete_skill 
ON Skills
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @deleted_skill_id INT;

    SELECT @deleted_skill_id = skill_id FROM deleted;

    -- Delete from team_skill_tag
    DELETE FROM team_skill_tag
    WHERE skill_id = @deleted_skill_id;

    -- Delete from employee_skills
    DELETE FROM employee_skills
    WHERE skill_id = @deleted_skill_id;

    -- Delete from Team (assuming cascading delete is not set up)
    UPDATE Team SET team_skill_id = NULL WHERE team_skill_id = @deleted_skill_id;
    DELETE FROM Skills WHERE skill_id = @deleted_skill_id;
END;
GO

--? Testing Insert Start 
-- SET IDENTITY_INSERT Team ON;
-- INSERT INTO Team (team_id, team_name, team_skill_id, team_lead_id)
-- VALUES (11, 'Testtingggg', 111, 2);  -- Assuming the team_skill_id from the previous insert is 1
-- SET IDENTITY_INSERT Team OFF;
-- SET IDENTITY_INSERT Skills ON;
-- INSERT INTO Skills (skill_id, skill_name, skill_description)
-- VALUES (111, 'Tessssster', 'Programming language for various applications'); 
-- SET IDENTITY_INSERT Skills OFF;
-- INSERT INTO employee_skills (employee_id, skill_id)
-- VALUES (2, 111); -- Assuming employee_id 2 exists 
-- --? Reset team_skill_id
-- UPDATE Team SET team_skill_id = 111 WHERE team_id = 11;
-- --? Insert team_skill_tag
-- INSERT INTO team_skill_tag (team_id, skill_id)
-- VALUES (11, 111); -- Assuming team_id 1 exists 
--?  Testing Insert End


-- --? Delete Query 
-- DELETE FROM Skills WHERE skill_id = 111
-- --? Display result
-- select * from Team 
select * from Team WHERE team_skill_id = 111
select * from Skills where skill_id = 111
select * from employee_skills WHERE skill_id = 111
select * from team_skill_tag  WHERE skill_id = 111
-- ! End


-- ! Delete Employee Trigger Testing Code (don't delete) 
-- CREATE OR ALTER TRIGGER handle_employee_departure
-- ON Employee
-- INSTEAD OF DELETE
-- AS
-- BEGIN
--     DECLARE @deleted_employee_id INT;

--     SELECT @deleted_employee_id = employee_id FROM deleted;

--     DELETE FROM Team 
--     WHERE team_lead_id = @deleted_employee_id;

--     -- Remove employee from team_member
--     DELETE FROM team_member 
--     WHERE member_id = @deleted_employee_id;

--     -- Clear assignments in team_task
--     UPDATE team_task 
--     SET assigned_employee_id = NULL
--     WHERE assigned_employee_id = @deleted_employee_id; 
--     DELETE FROM Employee WHERE employee_id = @deleted_employee_id; 
-- END;
-- Go

--? Insert Testing Value
SET IDENTITY_INSERT Employee ON; -- this allow to modify id value 
-- INSERT INTO Employee (employee_id, first_name, last_name, email, phone_number, address, birth_date, hire_date)
-- VALUES 
--     (111, 'Test', 'Tee', 'Test.tee@example.com', '555-444-2222', '789 Oak St, Testing City, Dummy', '0001-01-11', '0001-01-11');
-- INSERT INTO team_task (team_id, task_id, assigned_employee_id)
-- VALUES 
--     (1,5, 111);
-- INSERT INTO Team (team_name, team_skill_id, team_lead_id)
-- VALUES
--     (1,2, 111);
-- INSERT INTO team_member (role_id, member_id, team_id)
-- VALUES
--     (2, 111, 1)
SET IDENTITY_INSERT Employee OFF;

DELETE FROM Employee WHERE employee_id = 111
select * from Employee WHERE employee_id = 111
select * from Team WHERE team_lead_id = 111
select * from team_member WHERE member_id = 111
select * from team_task WHERE assigned_employee_id = 111
-- ! End
