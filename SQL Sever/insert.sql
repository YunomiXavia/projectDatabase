use pm;

-- INSERT INTO Employee (first_name, last_name, email, phone_number, address, birth_date, hire_date)
-- VALUES 
--     ('Michael', 'Johnson', 'michael.johnson@example.com', '555-123-4567', '789 Oak St, City, Country', '1985-07-10', '2019-06-01'),
--     ('Emily', 'Davis', 'emily.davis@example.com', '555-987-6543', '321 Pine St, City, Country', '1992-03-25', '2021-02-15'),
--     ('David', 'Wilson', 'david.wilson@example.com', '555-456-7890', '456 Maple St, City, Country', '1988-11-18', '2018-09-01'),
--     ('Sarah', 'Anderson', 'sarah.anderson@example.com', '555-789-1234', '987 Cedar St, City, Country', '1991-09-03', '2020-12-01'),
--     ('Christopher', 'Brown', 'christopher.brown@example.com', '555-234-5678', '654 Walnut St, City, Country', '1987-12-07', '2017-03-15')
--     ('Sarah', 'Smith', 'sarah.smith@example.com', '555-987-6543', '123 Maple Ave, City, Country', '1990-03-15', '2020-02-15');
--     ('John', 'Doe', 'john.doe@example.com', '555-111-2222', '123 Main St, City, Country', '1990-05-20', '2023-07-15'),
--     ('Amanda', 'Smith', 'amanda.smith@example.com', '555-333-4444', '456 Elm St, City, Country', '1988-10-12', '2022-09-30'),
--     ('Daniel', 'Miller', 'daniel.miller@example.com', '555-555-6666', '789 Pine St, City, Country', '1995-02-28', '2024-03-10'),
--     ('Nate', 'Roger', 'nate.nigga@example.com', '222-111-1234', '123 Walnut haha, City, Mathe', '1944-05-20', '2025-07-15');
--     ('Jessica', 'Wilson', 'jessica.wilson@example.com', '555-777-8888', '987 Oak St, City, Country', '1993-07-15', '2023-12-05'),
--     ('Ryan', 'Taylor', 'ryan.taylor@example.com', '555-999-0000', '321 Cedar St, City, Country', '1997-09-22', '2024-01-20')
--     ('Olivia', 'Martinez', 'olivia.martinez@example.com', '555-123-4567', '789 Pine St, City, Country', '1990-07-10', '2020-06-01'),
--     ('William', 'Taylor', 'william.taylor@example.com', '555-987-6543', '321 Oak St, City, Country', '1985-03-25', '2022-02-15'),
--     ('Emma', 'Anderson', 'emma.anderson@example.com', '555-456-7890', '456 Elm St, City, Country', '1988-11-18', '2019-09-01'),
--     ('James', 'Garcia', 'james.garcia@example.com', '555-789-1234', '987 Maple St, City, Country', '1991-09-03', '2021-12-01'),
--     ('Sophia', 'Jones', 'sophia.jones@example.com', '555-234-5678', '654 Cedar St, City, Country', '1987-12-07', '2018-03-15'),
--     ('Ethan', 'Rodriguez', 'ethan.rodriguez@example.com', '555-111-2222', '123 Walnut St, City, Country', '1993-05-20', '2023-07-15');

-- INSERT INTO Project (name, goal, number_of_employees, prefer_team, project_priority, project_status, start_date, end_date, project_manager_id)
-- VALUES  
--     ('Project A', 'Caffee Shop Website', 0, '["Web Development", "Tester", "Marketing"]', 'High', 'In Progress', '2023-01-01', NULL, 1),
--     ('Project F', 'Integration of AI into Existing Systems', 0, '["Artificial Intelligence", "Machine Learning", "Software Engineering"]', 'High', 'In Progress', '2023-06-15', NULL, 5),
--     ('Project C', 'Mobile Application Development', 0, '["Mobile Development", "QA", "Backend Development"]', 'High', 'In Progress', '2023-02-28', NULL, 3),
--     ('Project B', 'E-commerce Platform Development', 0, '["Web Development", "Database Administration", "UI/UX Design"]', 'Medium', 'Pending', '2023-04-15', NULL, 2),
--     ('Project D', 'Data Analysis Platform Development', 0, '["Data Science", "Database Administration", "Business Analysis"]', 'Medium', 'Pending', '2023-03-10', NULL, 4),
--     ('Project E', 'Internet of Things (IoT) Solution Development', 0, '["Embedded Systems", "Cloud Computing", "Data Engineering"]', 'High', 'In Progress', '2023-05-01', NULL, 6);
-- select * from Project

-- INSERT INTO Task (task_name, task_description, task_priority, status, due_date)
-- VALUES 
--     ('Design homepage', 'Design the main page of the website', 'High', 'Pending', '2023-01-10'),
--     ('Implement user authentication', 'Implement user authentication feature', 'Medium', 'In Progress', '2023-01-20'),
--     ('Test mobile app', 'Conduct thorough testing on different devices', 'High', 'Pending', '2023-03-01'),
--     ('Optimize database queries', 'Improve the efficiency of database queries', 'Medium', 'Pending', '2023-02-15'),
--     ('Analyze customer data', 'Extract insights from customer data', 'Low', 'Completed', '2023-01-25');

-- INSERT INTO Skills (skill_name, skill_description)
-- VALUES 
--     ('Web Development', 'Development of websites and web applications using various technologies'),
--     ('Tester', 'Testing software applications to ensure quality and functionality'),
--     ('Marketing', 'Promoting products or services to attract customers'),
--     ('Artificial Intelligence', 'Development of systems that simulate human intelligence'),
--     ('Machine Learning', 'Creating algorithms that improve automatically through experience'),
--     ('Software Engineering', 'Designing and building software systems efficiently and reliably'),
--     ('Mobile Development', 'Creating applications for mobile devices such as smartphones and tablets'),
--     ('QA', 'Testing and ensuring the quality of software products'),
--     ('Backend Development', 'Building server-side logic and databases for web applications'),
--     ('Database Administration', 'Managing and maintaining databases to ensure performance and security'),
--     ('UI/UX Design', 'Designing user interfaces and experiences for digital products'),
--     ('Data Science', 'Extracting insights and knowledge from data through various techniques'),
--     ('Business Analysis', 'Analyzing business processes and identifying opportunities for improvement'),
--     ('Embedded Systems', 'Designing and implementing systems with embedded hardware and software'),
--     ('Cloud Computing', 'Using remote servers hosted on the internet to store, manage, and process data'),
--     ('Data Engineering', 'Designing and managing large-scale data processing systems');

-- INSERT INTO Role (role_name, role_description)
-- VALUES 
--     ('Developer', 'Responsible for writing code and implementing software solutions.'),
--     ('Tester', 'Responsible for testing software applications to ensure quality and functionality.'),
--     ('Project Manager', 'Responsible for overseeing project execution and ensuring its success.'),
--     ('Database Administrator', 'Responsible for managing and maintaining databases.'),
--     ('UI/UX Designer', 'Responsible for designing user interfaces and experiences.'),
--     ('Data Scientist', 'Responsible for analyzing and interpreting complex data sets to inform business decisions.');
--     ('Web Development', 'Development of websites and web applications using various technologies'),
--     ('Testing', 'Conducting tests to ensure the quality and functionality of software applications'),
--     ('Manager', 'Responsible for overseeing teams, projects, and operations to ensure efficiency and success.'),
--     ('Marketing', 'Promoting products or services to attract customers');
--     ('CEO', 'Responsible for leading the company, making major corporate decisions, and managing overall operations and resources.'),
--     ('COO', 'Responsible for overseeing the day-to-day administrative and operational functions of the company.'),
--     ('CTO', 'Responsible for overseeing the development and implementation of the company"s technological strategy and solutions.');
--     ('Software Engineer', 'Responsible for designing, developing, and maintaining software applications.'),
--     ('Quality Assurance Analyst', 'Responsible for ensuring the quality of software products through testing and analysis.'),
--     ('System Administrator', 'Responsible for managing and maintaining computer systems and networks.'),
--     ('Data Engineer', 'Responsible for designing and implementing data pipelines and systems.'),
--     ('Business Analyst', 'Responsible for analyzing business processes and requirements to facilitate decision-making.'),
--     ('Technical Support Specialist', 'Responsible for providing technical assistance and support to end-users and customers.');
--     select * from Role


-- Now, let's insert some teams along with their skills (without team leads)
-- INSERT INTO Team (team_name, team_skill_id, team_lead_id)
-- VALUES 
--     ('Web Development Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Web Development'), (SELECT employee_id FROM Employee WHERE first_name = 'Michael' AND last_name = 'Johnson')),
--     ('Testing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Testing'), (SELECT employee_id FROM Employee WHERE first_name = 'Emily' AND last_name = 'Davis')),
--     ('Marketing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Marketing'), (SELECT employee_id FROM Employee WHERE first_name = 'David' AND last_name = 'Wilson'));
--     ('Backend Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Backend Development')),
--     ('Design Team', (SELECT skill_id FROM Skills WHERE skill_name = 'UI/UX Design')),
--     ('Data Analysis Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Data Science'));

-- INSERT INTO employee_skills (employee_id, skill_id)
-- VALUES 
--     ((SELECT employee_id FROM Employee WHERE first_name = 'Michael' AND last_name = 'Johnson'), (SELECT skill_id FROM Skills WHERE skill_name = 'Python')),
--     ((SELECT employee_id FROM Employee WHERE first_name = 'Michael' AND last_name = 'Johnson'), (SELECT skill_id FROM Skills WHERE skill_name = 'Data Analysis')),
--     ((SELECT employee_id FROM Employee WHERE first_name = 'Emily' AND last_name = 'Davis'), (SELECT skill_id FROM Skills WHERE skill_name = 'JavaScript')),
--     ((SELECT employee_id FROM Employee WHERE first_name = 'David' AND last_name = 'Wilson'), (SELECT skill_id FROM Skills WHERE skill_name = 'Database Management')),
--     ((SELECT employee_id FROM Employee WHERE first_name = 'Sarah' AND last_name = 'Anderson'), (SELECT skill_id FROM Skills WHERE skill_name = 'Python')),
--     ((SELECT employee_id FROM Employee WHERE first_name = 'Sarah' AND last_name = 'Anderson'), (SELECT skill_id FROM Skills WHERE skill_name = 'Data Analysis')),
--     ((SELECT employee_id FROM Employee WHERE first_name = 'Christopher' AND last_name = 'Brown'), (SELECT skill_id FROM Skills WHERE skill_name = 'Python'));

-- Now, let's associate tasks with teams in the team_task table
-- select * from Employee
-- SELECT prefer_team FROM Project;

-- Insert teams based on prefer_team values from the Project table
-- INSERT INTO Team (team_name, team_skill_id, team_lead_id)
-- VALUES 
--     ('Web Development Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Web Development'), (SELECT employee_id FROM Employee WHERE first_name = 'Michael' AND last_name = 'Johnson')),
--     ('Testing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Testing'), (SELECT employee_id FROM Employee WHERE first_name = 'Emily' AND last_name = 'Davis')),
--     ('Marketing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Marketing'), (SELECT employee_id FROM Employee WHERE first_name = 'David' AND last_name = 'Wilson'));

-- Insert more teams based on available skills and employees
-- INSERT INTO Team (team_name, team_skill_id, team_lead_id)
-- VALUES 
--     ('Backend Development Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Backend Development'), (SELECT employee_id FROM Employee WHERE first_name = 'Christopher' AND last_name = 'Brown')),
--     ('Data Science Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Data Science'), (SELECT employee_id FROM Employee WHERE first_name = 'Sarah' AND last_name = 'Anderson')),
--     ('Mobile Development Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Mobile Development'), (SELECT employee_id FROM Employee WHERE first_name = 'Sarah' AND last_name = 'Smith')),
--     ('Database Administration Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Database Administration'), (SELECT employee_id FROM Employee WHERE first_name = 'David' AND last_name = 'Wilson')),
--     ('UI/UX Design Team', (SELECT skill_id FROM Skills WHERE skill_name = 'UI/UX Design'), (SELECT employee_id FROM Employee WHERE first_name = 'Emily' AND last_name = 'Davis')),
--     ('Embedded Systems Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Embedded Systems'), (SELECT employee_id FROM Employee WHERE first_name = 'Christopher' AND last_name = 'Brown')),
--     ('Cloud Computing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Cloud Computing'), (SELECT employee_id FROM Employee WHERE first_name = 'Michael' AND last_name = 'Johnson'));


ALTER TABLE Team
ADD prefer_skills VARCHAR(255);

select * from Team
