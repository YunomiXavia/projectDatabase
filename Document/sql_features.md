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




### SQL Specical Features (Procedure, Trigger)
#### special feature requirement 
+ View Employee through Skill Tag
+ View Team through Skill Tag



#### procedure
#### trigger

- ? Features: View Employee through Skill Tag
```sql
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
- ? Features: View Team through Skill Tag
```sql
    CREATE OR ALTER PROCEDURE ListTeamsBySkillID
        @SkillID INT
    AS
    BEGIN
        SELECT t.team_name, t.team_skills, t.number_of_employee, t.project_name
        FROM Team t
        INNER JOIN team_skills ts ON t.team_id = ts.team_id
        INNER JOIN Skills s ON ts.skill_id = s.skill_id
        WHERE s.skill_id = @SkillID;
    END;
    Go
    -- select * from team_skills
    EXEC ListTeamsBySkillID 20;
```

- ? Features: View Team fit Project prefer_team
```sql
    CREATE PROCEDURE DisplayTeamsByProjectPreference
        @ProjectID INT
    AS
    BEGIN
        DECLARE @TeamList NVARCHAR(MAX)
        DECLARE @DynamicSQL NVARCHAR(MAX)

        -- Get the prefer_team list for the specified project
        SELECT @TeamList = prefer_team
        FROM Project
        WHERE project_id = @ProjectID;

        -- Construct the dynamic SQL to select teams based on prefer_team list
        SET @DynamicSQL = '
        SELECT t.team_name
        FROM Team t
        WHERE t.team_name IN (' + @TeamList + ')';

        -- Execute the dynamic SQL
        EXEC sp_executesql @DynamicSQL;
    END;
    GO
```