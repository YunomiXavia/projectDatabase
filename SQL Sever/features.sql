-- use pm;

INSERT INTO Skills (skill_name, skill_description)
SELECT * FROM (
    VALUES 
        ('Embedded Systems Engineer', 'Responsible for designing and developing embedded systems, including hardware and firmware components.'),
        ('Marketing Strategist', 'Develops marketing strategies and plans to promote products or services, analyzes market trends, and implements marketing campaigns.'),
        ('Machine Learning Engineer', 'Builds and implements machine learning models and algorithms to analyze data, extract insights, and make predictions.'),
        ('UX Designer', 'Focuses on enhancing user satisfaction by improving the usability, accessibility, and pleasure provided in the interaction between the user and the product.'),
        ('Data Scientist', 'Uses statistical techniques, machine learning algorithms, and programming skills to analyze large datasets and extract meaningful insights.'),
        ('System Administrator', 'Manages and maintains computer systems, networks, and software, ensuring their performance, reliability, and security.'),
        ('Social Media Manager', 'Creates and manages content on social media platforms to engage audiences, build brand awareness, and drive traffic to websites.'),
        ('Hardware Engineer', 'Designs, develops, and tests computer hardware components, such as processors, memory modules, and circuit boards.'),
        ('Systems Engineer', 'Plans, designs, and manages complex systems, integrating hardware, software, and network solutions to meet specific requirements.'),
        ('Back-end Developer', 'Builds and maintains server-side applications and databases, ensuring high performance, scalability, and security.'),
        ('Cloud Engineer', 'Designs, implements, and manages cloud-based infrastructure and services, leveraging platforms such as AWS, Azure, or Google Cloud.'),
        ('Firmware Engineer', 'Develops and optimizes firmware for embedded systems, including low-level programming and hardware interfacing.'),
        ('Content Creator', 'Produces engaging and relevant content for various platforms, such as websites, blogs, social media, and marketing materials.'),
        ('Front-end Developer', 'Builds and maintains client-side applications and user interfaces using HTML, CSS, and JavaScript frameworks.'),
        ('Quality Assurance Specialist', 'Tests software applications to ensure they meet quality standards, identify defects, and improve overall product quality.'),
        ('Automation Engineer', 'Designs, develops, and implements automated test scripts and frameworks to streamline testing processes and improve efficiency.'),
        ('Mobile Developer', 'Develops mobile applications for iOS or Android platforms, using programming languages such as Swift, Kotlin, or Java.'),
        ('Database Administrator', 'Manages and maintains databases, ensuring data integrity, security, and availability.'),
        ('Graphic Designer', 'Creates visual concepts and designs for various purposes, including branding, marketing materials, and user interfaces.'),
        ('UI/UX Designer', 'Focuses on enhancing user satisfaction by improving the usability, accessibility, and aesthetics of digital products.'),
        ('Data Analyst', 'Analyzes data to identify trends, patterns, and insights that can inform business decisions and strategies.'),
        ('UI Designer', 'Designs the user interface for digital products, including layout, navigation, and visual elements.'),
        ('Project Manager', 'Oversees projects from initiation to completion, managing resources, timelines, and budgets to ensure successful delivery.'),
        ('DevOps Engineer', 'Combines software development and IT operations to improve collaboration, automate processes, and deploy software more reliably and efficiently.')
) AS Skills (skill_name, skill_description);



-- note: insert the desire skills to Skill table before inserting to Team Table 
-- INSERT INTO Team (team_name, team_skill_id, team_lead_id, prefer_skills)
-- VALUES 
--     ('Web Development Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Web Development'), (SELECT employee_id FROM Employee WHERE first_name = 'Michael' AND last_name = 'Johnson'), '["Front-end Developer", "Back-end Developer", "Database Administrator", "DevOps Engineer", "Project Manager"]'),
--     ('Testing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Testing'), (SELECT employee_id FROM Employee WHERE first_name = 'Emily' AND last_name = 'Davis'), '["Quality Assurance Specialist", "Tester", "Automation Engineer", "Project Manager"]'),
--     ('Marketing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Marketing'), (SELECT employee_id FROM Employee WHERE first_name = 'David' AND last_name = 'Wilson'), '["Marketing Strategist", "Content Creator", "Social Media Manager", "Project Manager"]'),
--     ('Backend Development Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Backend Development'), (SELECT employee_id FROM Employee WHERE first_name = 'Christopher' AND last_name = 'Brown'), '["Back-end Developer", "Database Administrator", "DevOps Engineer", "Project Manager"]'),
--     ('Data Science Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Data Science'), (SELECT employee_id FROM Employee WHERE first_name = 'Sarah' AND last_name = 'Anderson'), '["Data Scientist", "Data Analyst", "Machine Learning Engineer", "Project Manager"]'),
--     ('Mobile Development Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Mobile Development'), (SELECT employee_id FROM Employee WHERE first_name = 'Sarah' AND last_name = 'Smith'), '["Mobile Developer", "UI/UX Designer", "Tester", "Project Manager"]'),
--     ('Database Administration Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Database Administration'), (SELECT employee_id FROM Employee WHERE first_name = 'David' AND last_name = 'Wilson'), '["Database Administrator", "Data Analyst", "System Administrator", "Project Manager"]'),
--     ('UI/UX Design Team', (SELECT skill_id FROM Skills WHERE skill_name = 'UI/UX Design'), (SELECT employee_id FROM Employee WHERE first_name = 'Emily' AND last_name = 'Davis'), '["UI Designer", "UX Designer", "Graphic Designer", "Project Manager"]'),
--     ('Embedded Systems Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Embedded Systems'), (SELECT employee_id FROM Employee WHERE first_name = 'Christopher' AND last_name = 'Brown'), '["Embedded Systems Engineer", "Hardware Engineer", "Firmware Engineer", "Project Manager"]'),
--     ('Cloud Computing Team', (SELECT skill_id FROM Skills WHERE skill_name = 'Cloud Computing'), (SELECT employee_id FROM Employee WHERE first_name = 'Michael' AND last_name = 'Johnson'), '["Cloud Engineer", "DevOps Engineer", "Systems Engineer", "Project Manager"]');

select * from Skills
-- select * from Project



