-- Thứ tự tạo bảng: Các Bảng Chính -> các Bảng Liên Kết 
use pm
-- Bảng Chính
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY IDENTITY(1,1), -- Auto-incrementing ID
    first_name NVARCHAR(30) NOT NULL,
    last_name NVARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,  -- Enforce unique emails
    phone_number VARCHAR(15), -- More flexible format than CHAR
    address NVARCHAR(75),
    birth_date DATE,  -- DATE might be sufficient if you don't need time
    hire_date DATE  NOT NULL,
);


CREATE TABLE Project (
    project_id INT PRIMARY KEY IDENTITY(1,1), -- Auto-incrementing ID
    name NVARCHAR(30) NOT NULL, 
    goal NVARCHAR(50) NOT NULL,
    number_of_employees INT, -- More flexibility than restricting beforehand
    project_priority VARCHAR(10) CHECK (project_priority IN ('Low', 'Medium', 'High')), -- Enforce valid priorities
    project_status NVARCHAR(20) CHECK (project_status IN ('Pending', 'In Progress', 'Completed')),  -- Predefined statuses
    start_date DATETIME NOT NULL,
    end_date DATETIME,
    project_manager_id int, 
    FOREIGN KEY (project_manager_id) REFERENCES Employee(employee_id) 
); 


CREATE TABLE Task (
    task_id INT PRIMARY KEY IDENTITY(1,1), -- Auto-incrementing ID
    task_name NVARCHAR(30) NOT NULL,
    task_description NVARCHAR(255), 
    task_priority VARCHAR(10) CHECK (task_priority IN ('Low', 'Medium', 'High')), -- Enforce priorities
    status NVARCHAR(20) CHECK (status IN ('Pending', 'In Progress', 'Completed')), -- Predefined statuses
    due_date DATETIME, 
); 


CREATE TABLE Skills(
    skill_id INT PRIMARY KEY IDENTITY(1,1), 
    skill_name NVARCHAR(50) UNIQUE NOT NULL,  -- Enforce unique skill names
    skill_description NVARCHAR(255) 
); 


CREATE TABLE Team (
    team_id INT PRIMARY KEY IDENTITY(1,1), 
    team_name NVARCHAR(30) UNIQUE NOT NULL, 
	team_skill_id INT,  -- Could be NULL initially
	team_lead_id INT,  -- Could be NULL initially   
    team_status VARCHAR(10) CHECK (team_status IN ('Active', 'Inactive')),
    FOREIGN KEY (team_lead_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (team_skill_id) REFERENCES Skills(skill_id),
); 


CREATE TABLE Role (
    role_id INT PRIMARY KEY IDENTITY(1,1), 
    role_name NVARCHAR(50) UNIQUE NOT NULL,  -- Enforce unique role names
    role_description NVARCHAR(255) 
); 


CREATE TABLE team_task (
    team_id INT NOT NULL, 
    task_id INT NOT NULL,
    assigned_employee_id INT NULL, -- Allow for unassigned tasks initially
    PRIMARY KEY (team_id, task_id), -- Composite key 
    FOREIGN KEY (team_id) REFERENCES Team(team_id),
    FOREIGN KEY (task_id) REFERENCES Task(task_id),
    FOREIGN KEY (assigned_employee_id) REFERENCES Employee(employee_id),
); 


CREATE TABLE team_skill_tag(
    team_id INT NOT NULL,
    skill_id INT NOT NULL, 
    PRIMARY KEY (skill_id, team_id), 
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id),
    FOREIGN KEY (team_id) REFERENCES Team(team_id) 
); 


CREATE TABLE project_prefer_skills(
    project_id INT NOT NULL,
    skill_id INT NOT NULL, 
    PRIMARY KEY (skill_id, project_id), 
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id) 
); 


CREATE TABLE team_project(
    team_id INT NOT NULL, 
    project_id INT NOT NULL,
    PRIMARY KEY (team_id, project_id), 
    FOREIGN KEY (team_id) REFERENCES Team(team_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id) 
); 


CREATE TABLE team_member(
    role_id INT NOT NULL, 
    member_id INT NOT NULL,
	team_id INT NOT NULL,

    PRIMARY KEY (role_id, member_id, team_id), 
    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    FOREIGN KEY (member_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (team_id) REFERENCES Team(team_id) 
); 


CREATE TABLE employee_skills (
    employee_id INT NOT NULL, 
    skill_id INT NOT NULL,
    PRIMARY KEY (employee_id, skill_id), -- Composite key 
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id),
); 


--? Archive 
-- CREATE TABLE project_assignment (
--     employee_id INT NOT NULL, 
--     project_id INT NOT NULL,
--     PRIMARY KEY (employee_id, project_id), 
--     FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
--     FOREIGN KEY (project_id) REFERENCES Project(project_id),
-- ); 
