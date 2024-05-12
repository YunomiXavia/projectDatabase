
Delete Skill Tag
```sql
    DELETE FROM Skills WHERE skill_id = 111;
```

Update Role Tag
```sql
    UPDATE Role
    SET role_name = 'Tên_role_mới', role_description = 'Mô_tả_role_mới'
    WHERE role_id = 111;
```

QUẢN LÝ ROLE 
Create Role Tag
```sql
    INSERT INTO Role (role_name, role_description)
    VALUES ('Tên_role_mới', 'Mô_tả_role_mới');
    Read Role Tag
    SELECT * FROM ROLE
```

Read Role Tag
```sql
    SELECT * FROM ROLE
```

Update Role Tag
```sql
    UPDATE Role
    SET role_name = 'Tên_role_mới', role_description = 'Mô_tả_role_mới'
    WHERE role_id = 111;
```
Delete Role Tag
```sql
    DELETE FROM ROLE WHERE role_id = 111
```

QUẢN LÝ TASK
Create Task
```sql

	INSERT INTO Task (task_name, task_description, task_priority, status, due_date)
	VALUES 
    ('Develop new feature', 'Implement new feature X according to specifications',
     'High', 'Pending', '2024-05-15');	

```

Read Task
```sql
    SELECT * FROM TASK
```
Update Task
```sql
    UPDATE Task
    SET
        task_name = 'Phát triển tính năng mới',
        task_description = 'Triển khai tính năng X theo yêu cầu',
        task_priority = 'High',
        status = 'In Progress',
        due_date = '2024-05-20'
    WHERE
        task_id =  111;
```
Delete Task
```sql
    DELETE FROM Task WHERE id = 111
```

QUẢN LÝ EMPLOYEE
Create Employee
```sql
	INSERT INTO employees (first_name, last_name, email, phone_number, address, birth_date, hire_date)
	VALUES ('Họ', 'Tên', 'Email', 'Số điện thoại', 'Địa chỉ', 'Ngày sinh', 'Ngày tuyển dụng');
```
Read Employee
```sql
    SELECT * FROM Employee;
```
Update Employee
```sql
    UPDATE Employee
	SET first_name = 'Họ mới', last_name = 'Tên mới',
        email = 'Email mới', phone_number = 'Số điện thoại mới',
        address = 'Địa chỉ mới', birth_date = 'Ngày sinh mới',
        hire_date = 'Ngày tuyển dụng mới'
	WHERE employee_id = 111;
```
Delete Employee
```sql
    DELETE FROM Employee
    WHERE employee_id = 111;
```

QUẢN LÝ TEAM
Create Team:
```sql
	INSERT INTO Team (team_name, team_skill_id, team_lead_id, team_status)
	VALUES 
    ('Tên nhóm mới', id_kỹ_năng, id_nhân_viên_trưởng_nhóm, 'Trạng thái nhóm');
```
Read Team
```sql
	SELECT
    	t.team_id,
    	t.team_name,
    	s.skill_name AS team_skill,
    	CONCAT(e.first_name, ' ', e.last_name) AS team_lead,
    	COUNT(tm.member_id) AS number_of_members
	FROM
    		Team t
	LEFT JOIN
    		Skills s ON t.team_skill_id = s.skill_id
	LEFT JOIN
    		Employee e ON t.team_lead_id = e.employee_id
	LEFT JOIN
    		team_member tm ON t.team_id = tm.team_id
	GROUP BY
    		t.team_id, t.team_name, s.skill_name, e.first_name, e.last_name;
```
Update Team
```sql
	UPDATE Team
	SET
    	team_name = 'Tên nhóm mới',
    	team_skill_id = 'ID kỹ năng mới',
    	team_lead_id = 'ID trưởng nhóm mới'
	WHERE
    	team_id = 111;
```
Delete Team
```sql
    DELETE FROM Team WHERE team_id = 111
```

QUẢN LÝ PROJECT
Create Project:
```sql
	INSERT INTO Project (name, goal, number_of_employees, prefer_team, project_priority, project_status, start_date, end_date, project_manager_id)
	VALUES 
    ('Tên dự án', 'Mục tiêu dự án', [Số lượng nhân viên], 'Đội ưu tiên',
     'Mức độ ưu tiên', 'Trạng thái dự án', 'Ngày bắt đầu', 'Ngày kết thúc', [ID của quản lý án]);
```
Read Project
```sql
select * from Project
```

Read Project Basic Attribute
```sql
	SELECT
    	p.*
    	CONCAT(e.first_name, ' ', e.last_name) AS project_manager,
    	COUNT(DISTINCT tp.team_id) AS number_of_teams
	FROM
        Project p
	LEFT JOIN
        Employee e ON p.project_manager_id = e.employee_id
	LEFT JOIN
        team_project tp ON p.project_id = tp.project_id
	GROUP BY
        p.project_id, p.name, p.goal, p.number_of_employees, p.project_priority, p.project_status, p.start_date, p.end_date, e.first_name, e.last_name;
```
Read all Skill Required for the Project
```sql
	SELECT s.skill_name, s.skill_description
	FROM Skills s
	JOIN project_prefer_skills pps ON s.skill_id = pps.skill_id
	WHERE pps.project_id = 1; -- Assuming Project A is project_id 1
```
View all Team in the Project
```sql
	SELECT t.team_id, t.team_name
	FROM Team t
	JOIN team_project tp ON t.team_id = tp.team_id
	WHERE tp.project_id = 111;  
```

Update Project
Update Project Basic Attributes
```sql
UPDATE Project
	SET name = 'Tên dự án mới', goal = 'Mục tiêu dự án mới', number_of_employees = [Số lượng nhân viên mới], prefer_team = 'Đội ưu tiên mới', project_priority = 'Mức độ ưu tiên mới', project_status = 'Trạng thái dự án mới', start_date = 'Ngày bắt đầu mới', end_date = 'Ngày kết thúc mới', project_manager_id = [ID của quản lý dự án mới]
	WHERE project_id = 111;
```
Update Project Status (not Delete Project)
```sql
	UPDATE Project
	SET project_status = 'Completed' -- ('Pending', 'In Progress', 'Completed')
	WHERE project_id = 111;
	select * from Project;
```

Update Project Priority
```sql
	UPDATE Project
	SET project_priority = 'Low' -- ('Low', 'Medium', 'High')
	WHERE project_id = 1;
	select * from Project;
```

3.3.1.2.          Triggers và Procedures 
Trigger và Procedures cho từng Tính năng 
FEATURES 1: View Employee by Skill Tag
Description: This stored procedure retrieves a list of employees who have a specific skill ID.
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
	EXEC ListEmployeesBySkillID 1; -- Web Development
```
FEATURES 2: View Employee by Team Skill Tag
```sql
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
SELECT * FROM team_skill_tag
```
FEATURES 3: View Team by skill_Id
Description: 	Used to display teams based on a specific skill ID. 
```sql
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
FEATURES 4: View Employees on a Team with Specific Skill
Description: This query selects the first name, last name, and email of employees who have the skill with skill_id 1 and are part of the 'Web Development Team'.
```sql
    CREATE OR ALTER PROCEDURE GetTeamMembersBySkill
        @team_name NVARCHAR(100),
        @skill_id INT
        AS
    BEGIN
        SELECT e.employee_id, e.first_name, e.last_name, e.email
        FROM Employee e
        JOIN employee_skills es ON e.employee_id = es.employee_id
        JOIN team_skill_tag tst ON es.skill_id = tst.skill_id
        JOIN Team t ON tst.team_id = t.team_id
        WHERE t.team_name = @team_name AND tst.skill_id = @skill_id;
    END;
    Go
    EXEC GetTeamMembersBySkill @team_name = 'Web Development Team', @skill_id = 1;

    select * from team_member
    select * from team WHERE team_name = 'Web Development Team'
```
