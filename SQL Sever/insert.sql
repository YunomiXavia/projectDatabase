INSERT INTO Employee (first_name, last_name, email, phone_number, address, birth_date, hire_date)
VALUES 
    ('Michael', 'Johnson', 'michael.johnson@example.com', '555-123-4567', '789 Oak St, City, Country', '1985-07-10', '2019-06-01'),
    ('Emily', 'Davis', 'emily.davis@example.com', '555-987-6543', '321 Pine St, City, Country', '1992-03-25', '2021-02-15'),
    ('David', 'Wilson', 'david.wilson@example.com', '555-456-7890', '456 Maple St, City, Country', '1988-11-18', '2018-09-01'),
    ('Sarah', 'Anderson', 'sarah.anderson@example.com', '555-789-1234', '987 Cedar St, City, Country', '1991-09-03', '2020-12-01'),
    ('Christopher', 'Brown', 'christopher.brown@example.com', '555-234-5678', '654 Walnut St, City, Country', '1987-12-07', '2017-03-15')
    ('Sarah', 'Smith', 'sarah.smith@example.com', '555-987-6543', '123 Maple Ave, City, Country', '1990-03-15', '2020-02-15');



INSERT INTO Project (name, goal, number_of_employees, prefer_team, project_priority, project_status, start_date, end_date, project_manager_id)
VALUES  
    ('Project A', 'Caffee Shop Website', 0, '["Web Development", "Tester", "Marketing"]', 'High', 'In Progress', '2023-01-01', NULL, 1),
    ('Project F', 'Integration of AI into Existing Systems', 0, '["Artificial Intelligence", "Machine Learning", "Software Engineering"]', 'High', 'In Progress', '2023-06-15', NULL, 5),
    ('Project C', 'Mobile Application Development', 0, '["Mobile Development", "QA", "Backend Development"]', 'High', 'In Progress', '2023-02-28', NULL, 3),
    ('Project B', 'E-commerce Platform Development', 0, '["Web Development", "Database Administration", "UI/UX Design"]', 'Medium', 'Pending', '2023-04-15', NULL, 2),
    ('Project D', 'Data Analysis Platform Development', 0, '["Data Science", "Database Administration", "Business Analysis"]', 'Medium', 'Pending', '2023-03-10', NULL, 4),
    ('Project E', 'Internet of Things (IoT) Solution Development', 0, '["Embedded Systems", "Cloud Computing", "Data Engineering"]', 'High', 'In Progress', '2023-05-01', NULL, 6);

select * from Project

