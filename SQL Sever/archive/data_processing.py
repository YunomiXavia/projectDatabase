# old data
list = [
    ('Web Development', 'Development of websites and web applications using various technologies'),
    ('Tester', 'Testing software applications to ensure quality and functionality'),
    ('Marketing', 'Promoting products or services to attract customers'),
    ('Artificial Intelligence', 'Development of systems that simulate human intelligence'),
    ('Machine Learning', 'Creating algorithms that improve automatically through experience'),
    ('Software Engineering', 'Designing and building software systems efficiently and reliably'),
    ('Mobile Development', 'Creating applications for mobile devices such as smartphones and tablets'),
    ('QA', 'Testing and ensuring the quality of software products'),
    ('Backend Development', 'Building server-side logic and databases for web applications'),
    ('Database Administration', 'Managing and maintaining databases to ensure performance and security'),
    ('UI/UX Design', 'Designing user interfaces and experiences for digital products'),
    ('Data Science', 'Extracting insights and knowledge from data through various techniques'),
    ('Business Analysis', 'Analyzing business processes and identifying opportunities for improvement'),
    ('Embedded Systems', 'Designing and implementing systems with embedded hardware and software'),
    ('Cloud Computing', 'Using remote servers hosted on the internet to store, manage, and process data'),
    ('Data Engineering', 'Designing and managing large-scale data processing systems'),
    ('Python', 'A high-level programming language known for its simplicity and readability.'),
    ('Data Analysis', 'The process of inspecting, cleaning, transforming, and modeling data to discover useful information, inform conclusions, and support decision-making.'),
    ('JavaScript', 'A programming language that enables interactive web pages and dynamic content.'),
    ('Database Management', 'The process of administering, controlling, and managing databases to ensure their security, integrity, and performance.'),
    ('Java', 'A popular, object-oriented programming language used for developing a wide range of applications.'),
    ('C++', 'A versatile programming language known for its efficiency and performance, commonly used in system and game development.'),
    ('C#', 'A modern programming language developed by Microsoft, often used for building Windows applications and games.'),
    ('Ruby', 'A dynamic, reflective, object-oriented programming language known for its simplicity and productivity.'),
    ('PHP', 'A server-side scripting language used for web development and creating dynamic web pages.'),
    ('Swift', 'A powerful and intuitive programming language used for developing iOS, macOS, watchOS, and tvOS apps.'),
    ('Back-end Development', 'The development of server-side logic and databases for web applications.'),
    ('Front-end Development', 'The development of client-side interfaces and user experiences for web applications.'),
    ('.NET', 'A framework developed by Microsoft for building various types of applications, including web, desktop, and mobile applications.'),
    ('Web API', 'A framework for building HTTP services that can be consumed by a broad range of clients, including browsers, mobile devices, and IoT devices.'),
    ('Web MVC', 'A design pattern and framework for building web applications that separates the application into three main components: Model, View, and Controller.'),
    ('DevOps', 'A set of practices that combines software development (Dev) and IT operations (Ops) to shorten the systems development life cycle and provide continuous delivery with high software quality.'),
    ('Kotlin', 'A statically typed programming language developed by JetBrains and officially supported by Google as an Android development language.'),
]

# inserted data
data = [
    ["Front-end Developer", "Back-end Developer", "Database Administrator", "DevOps Engineer", "Project Manager"],
    ["Quality Assurance Specialist", "Tester", "Automation Engineer", "Project Manager"],
    ["Marketing Strategist", "Content Creator", "Social Media Manager", "Project Manager"],
    ["Back-end Developer", "Database Administrator", "DevOps Engineer", "Project Manager"],
    ["Data Scientist", "Data Analyst", "Machine Learning Engineer", "Project Manager"],
    ["Mobile Developer", "UI/UX Designer", "Tester", "Project Manager"],
    ["Database Administrator", "Data Analyst", "System Administrator", "Project Manager"],
    ["UI Designer", "UX Designer", "Graphic Designer", "Project Manager"],
    ["Embedded Systems Engineer", "Hardware Engineer", "Firmware Engineer", "Project Manager"],
    ["Cloud Engineer", "DevOps Engineer", "Systems Engineer", "Project Manager", "Artificial Intelligence"],
]

# old data
data2 = [
    ["Web Development", "Tester", "Marketing"],
    ["Artificial Intelligence", "Machine Learning", "Software Engineering"],
    ["Mobile Development", "QA", "Backend Development"],
    ["Web Development", "Database Administration", "UI/UX Design"],
    ["Data Science", "Database Administration", "Business Analysis"],
    ["Embedded Systems", "Cloud Computing", "Data Engineering"],
]


# origin project skill
all_skills = set()  # Using a set automatically handles duplicates
# new project skill
new_skills = set()

for skill, _ in list:
    all_skills.add(skill)

for sublist2 in data2:
    for skill in sublist2:
        all_skills.add(skill)

for sublist1 in data:
    for skill in sublist1:
        if skill not in all_skills:
            new_skills.add(skill)

num = len(new_skills)
for skill in new_skills:
    print(skill)
print(num)



