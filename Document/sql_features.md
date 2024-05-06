# SQL Features Docuemnt

## SQL Basic Features (CRUD - Create, Read, Update, Delete)
### Tag, Role
**Manage Tag, Role**
Insert Tag và Role (in UI it mean Create Employee)
View Tag và Role
Edit Tag và Role
Delete Tag và Role

### Employees
**Manage Employee**
Insert Employee
View Employee
Edit Employee
Delete Employee

### Team
**Manage Team**
Insert Team
View Team
Edit Team
Delete Team

### Project
**Manage Project**
Insert Project
View Project
Edit Project
Delete Project

- ? Set Project to project_status 
```sql
    UPDATE Project
    SET project_status = 'Completed' -- ('Pending', 'In Progress', 'Completed')
    WHERE project_id = 1;
    select * from Project;
```
- ? Set Project to project_priority
```sql
    UPDATE Project
    SET project_priority = 'Low' -- ('Low', 'Medium', 'High')
    WHERE project_id = 1;
    select * from Project;
```
- ? Update start_data and Update end_date
```sql
    UPDATE Project
    SET start_data = '2022-10-01', end_date = '2022-12-01'
    WHERE project_id = 1;
    select * from Project;
```


### SQL Specical Features (Procedure, Trigger)
#### special feature requirement 
+ View Employee through Skill Tag
+ View Team through Skill Tag
+ ....


#### Procedures
- ? Team Features: View Employee through Skill Tag
```sql
        /*
            Procedure: ListEmployeesBySkillID

            Description:
            This stored procedure retrieves a list of employees who have a specific skill ID.

            Parameters:
            - @SkillID: The ID of the skill to filter the employees by.

            Returns:
            The result set includes the first name, last name, email, phone number, and hire date of the employees who have the specified skill ID.
        */

        CREATE OR ALTER PROCEDURE ListEmployeesBySkillID
            @SkillID INT
        AS
        BEGIN
            SELECT e.first_name, e.last_name, e.email, e.phone_number, e.hire_date
            FROM Employee e
            INNER JOIN employee_skills es ON e.employee_id = es.employee_id
            INNER JOIN Skills s ON es.skill_id = s.skill_id
            WHERE s.skill_id = @SkillID;
        END;
        Go
        -- select * from employee_skills
        EXEC ListEmployeesBySkillID 20;
```


- ? Project Procedure: Skill needed for a Project
```sql
    SELECT s.skill_name, s.skill_description
    FROM Skills s
    JOIN project_prefer_skills pps ON s.skill_id = pps.skill_id
    WHERE pps.project_id = 1; -- Assuming Project A is project_id 1
```

- ? Project Procedure: Team in a Project
```sql
    SELECT t.team_id, t.team_name
    FROM Team t
    JOIN team_project tp ON t.team_id = tp.team_id
    WHERE tp.project_id = 1;  -- Assuming you want teams for Project 3
```

- ? Team Procedure: Employees on a Team with Specific Skill
```sql
    -- This query selects the first name, last name, and email of employees who have the skill with skill_id 1 and are part of the 'Web Development Team'.
        SELECT e.first_name, e.last_name, e.email
        FROM Employee e
        JOIN employee_skills es ON e.employee_id = es.employee_id
        JOIN team_skill_tag tst ON es.skill_id = tst.skill_id
        JOIN Team t ON tst.team_id = t.team_id
        WHERE t.team_name = 'Web Development Team' AND tst.skill_id = 1; -- Assuming skill_id 7 is 'Mobile Development'
```

- ? Team Procedure: Display Teams by Skill ID 
```sql
    -- This stored procedure is used to display teams based on a specific skill ID.
        -- It takes a parameter called @skill_id_param, which represents the skill ID to filter the teams by.
        CREATE PROCEDURE display_teams_by_skill_id 
            @skill_id_param INT
        AS
        BEGIN
            -- The SELECT statement retrieves the team ID, team name, skill name, and skill description
            -- from the Team, team_skill_tag, and Skills tables.
            SELECT DISTINCT t.team_id, t.team_name, s.skill_name, s.skill_description
            FROM Team t
            JOIN team_skill_tag tst ON t.team_id = tst.team_id
            JOIN Skills s ON tst.skill_id = s.skill_id
            WHERE s.skill_id = @skill_id_param; 
            -- The WHERE clause filters the result set based on the provided skill ID parameter.
            -- Only teams with the specified skill ID will be returned.
        END;
```

- ? Display Employees by Team Skill Tag
```sql
    /*
        Procedure: display_employees_by_team_skill
        Description: This procedure displays the employees who have skills matching a specified team's ID.
        Parameters:
            - @team_id: The ID of the desired team.
        Returns: None
        */

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

        EXEC display_employees_by_team_skill @team_id = 3; -- Execute the procedure with team_id = 1
        SELECT * from Team; -- Display the list of teams
```

- ? Display Employees by Skill Tag and Which Team they in
```sql
    -- This stored procedure displays employees who have a specific skill.

    -- Creating or altering the stored procedure 'display_employees_by_skill'
    CREATE OR ALTER PROCEDURE display_employees_by_skill 
        @skill_id INT -- The ID of the skill to filter employees by
    AS
    BEGIN
        -- Selecting the necessary employee details and team name
        SELECT 
            e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, t.team_name
        FROM Employee e
        JOIN employee_skills es ON e.employee_id = es.employee_id
        JOIN team_member tm ON e.employee_id = tm.member_id 
        JOIN Team t ON tm.team_id = t.team_id 
        WHERE es.skill_id = @skill_id; -- Filtering employees by the specified skill ID
    END;
    GO

    -- Executing the stored procedure with a specific skill ID
    EXEC display_employees_by_skill @skill_id = 17; -- Assuming skill_id 7 represents 'Mobile Development'
```


#### Triggers
- ? We Cannot perform an aggregate function on an expression containing an aggregate or a subquery. 
- ? Trigger: Update Project 'number_of_employees' by counting the sum of each team total employees relevant to that project (note: not using team_member)
```sql
    -- trigger on insert and update
    CREATE OR ALTER TRIGGER update_teams_project_count_trigger 
    ON team_member
    AFTER INSERT, DELETE
    AS
    BEGIN
        DECLARE @team_id INT;
        DECLARE @team_emp INT;
        SELECT @team_emp = Count(member_id) from team_member WHERE team_id = @team_id;

        -- Handle employee insertions
        SELECT @team_id = team_id FROM inserted;
        UPDATE Project 
        SET number_of_employees = @team_emp
        WHERE project_id IN (SELECT project_id FROM team_project WHERE team_id = @team_id); 

        -- Handle employee deletions
        SELECT @team_id = team_id FROM deleted;
        UPDATE Project 
        SET number_of_employees = @team_emp
        WHERE project_id IN (SELECT project_id FROM team_project WHERE team_id = @team_id); 
    END;
```

- ? Trigger to Delete Skills and it dependency: skill_id from Team , employee_skills, team_skill_tag 
```sql
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

        -- Delete from employee_skills
        DELETE FROM project_prefer_skills
        WHERE skill_id = @deleted_skill_id;

        -- Delete from Team (assuming cascading delete is not set up)
        UPDATE Team SET team_skill_id = NULL WHERE team_skill_id = @deleted_skill_id;
        DELETE FROM Skills WHERE skill_id = @deleted_skill_id;


    END;
    GO
```

- ? Delete an employee and its dependency like member_id from team_member, assigned_employee_id from team_task, team_lead_id from team
```sql
    CREATE OR ALTER TRIGGER handle_employee_departure
    ON Employee
    INSTEAD OF DELETE
    AS
    BEGIN
        DECLARE @deleted_employee_id INT;

        SELECT @deleted_employee_id = employee_id FROM deleted;

        DELETE FROM Team 
        WHERE team_lead_id = @deleted_employee_id;

        -- Remove employee from team_member
        DELETE FROM team_member 
        WHERE member_id = @deleted_employee_id;

        -- Clear assignments in team_task
        UPDATE team_task 
        SET assigned_employee_id = NULL
        WHERE assigned_employee_id = @deleted_employee_id; 
        DELETE FROM Employee WHERE employee_id = @deleted_employee_id; 
    END;
```

- ? Delete a Task and its dependency like task_id from team_task 
```sql
    CREATE OR ALTER TRIGGER cascade_delete_task 
    ON Task
    AFTER DELETE
    AS
    BEGIN
        DECLARE @deleted_task_id INT;

        SELECT @deleted_task_id = task_id FROM deleted;

        -- Delete dependencies from team_task
        DELETE FROM team_task
        WHERE task_id = @deleted_task_id; 
    END;
```
- ? Change Team status to Deactive instead of Delete (since Team hold many contraint and valuable infomation)
```sql
    update Team
    set team_status = 'Deactive' -- status: Active/Deactive
    where team_id = 1

    select * from Team
```