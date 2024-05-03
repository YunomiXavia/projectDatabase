use pm;

-- DELETE FROM Project;

-- INSERT INTO Project (name, goal, number_of_employees, prefer_team, project_priority, project_status, start_date, end_date, project_manager_id)
-- VALUES  
--     ('Project A', 'Caffee Shop Website', 0, '["Web Development", "Tester", "Marketing"]', 'High', 'In Progress', '2023-01-01', NULL, 1),
--     ('Project F', 'Integration of AI into Existing Systems', 0, '["Artificial Intelligence", "Machine Learning", "Software Engineering"]', 'High', 'In Progress', '2023-06-15', NULL, 5),
--     ('Project C', 'Mobile Application Development', 0, '["Mobile Development", "QA", "Backend Development"]', 'High', 'In Progress', '2023-02-28', NULL, 3),
--     ('Project B', 'E-commerce Platform Development', 0, '["Web Development", "Database Administration", "UI/UX Design"]', 'Medium', 'Pending', '2023-04-15', NULL, 2),
--     ('Project D', 'Data Analysis Platform Development', 0, '["Data Science", "Database Administration", "Business Analysis"]', 'Medium', 'Pending', '2023-03-10', NULL, 4),
--     ('Project E', 'Internet of Things (IoT) Solution Development', 0, '["Embedded Systems", "Cloud Computing", "Data Engineering"]', 'High', 'In Progress', '2023-05-01', NULL, 6);



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
--     ('Marketing', 'Promoting products or services to attract customers');
--     select * from Role

-- -- Now, let's insert some teams along with their skills and team leads
-- INSERT INTO Team (team_name, team_skill_id, team_lead_id)
-- VALUES 
--     ('Web Development Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Web Development'), (SELECT employee_id FROM Employee WHERE first_name = 'Michael' AND last_name = 'Johnson')),
--     ('Testing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Testing'), (SELECT employee_id FROM Employee WHERE first_name = 'Emily' AND last_name = 'Davis')),
--     ('Marketing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Marketing'), (SELECT employee_id FROM Employee WHERE first_name = 'David' AND last_name = 'Wilson'));

-- select * from Skills
-- Now, let's insert some teams along with their skills (without team leads)
-- INSERT INTO Team (team_name, team_skill_id)
-- VALUES 
--     ('Backend Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Backend Development')),
--     ('Design Team', (SELECT skill_id FROM Skills WHERE skill_name = 'UI/UX Design')),
--     ('Data Analysis Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Data Science'));
select * from team_member
