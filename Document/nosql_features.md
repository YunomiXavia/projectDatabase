# NO-SQL Features Docuemnt

## NO-SQL Basic Features (CRUD - Create, Read, Update, Delete)

### Tag, Role

**Manage Tag, Role**

- Insert Skill and Role Tag and Task:

* Add Skills Tag:

```javascript
// Add Skills Tag
const addSkillsTag = (skillName, skillDescription) => {
    const skillId = getNextSequenceValue("skill_id");
    db.skills.insertOne({
        skill_id: skillId,
        skill_name: skillName,
        skill_description: skillDescription
    });
};
```

- Add Role Tag:

```javascript
// Add Role Tag
const addRoleTag = (roleName, roleDescription) => {
    const roleId = getNextSequenceValue("role_id");
    db.role.insertOne({
        role_id: roleId,
        role_name: roleName,
        role_description: roleDescription
    });
};
```

- Add Task:

```javascript
// Add Task
const addTask = (taskName, taskDescription, taskPriority, status, dueDate) => {
    const taskId = getNextSequenceValue("task_id");
    db.task.insertOne({
        task_id: taskId,
        task_name: taskName,
        task_description: taskDescription,
        task_priority: taskPriority,
        status: status,
        due_date: dueDate
    });
};
```

- View Skills and Role Tag and Task:

* View Skills Tag:

```javascript
const viewSkillsTag = () => {
    return db.skills.find().toArray();
};
```

- View Role Tag:

```javascript
const viewRoleTag = () => {
    return db.role.find().toArray();
};
```

- Edit Skills and Role Tag and Task:

* Edit Skills Tag:

```javascript
// Edit Skills Tag
const editSkillsTag = (skillId, newSkillName, newSkillDescription) => {
    db.skills.updateOne(
        { skill_id: skillId },
        { $set: { skill_name: newSkillName, skill_description: newSkillDescription } }
    );
};
```

- Edit Role Tag:

```javascript
// Edit Role Tag
const editRoleTag = (roleId, newRoleName, newRoleDescription) => {
    db.role.updateOne(
        { role_id: roleId },
        { $set: { role_name: newRoleName, role_description: newRoleDescription } }
    );
};
```

- Add Task:

```javascript
// Add Task
const addTask = (taskName, taskDescription, taskPriority, status, dueDate) => {
    const taskId = getNextSequenceValue("task_id");
    db.task.insertOne({
        task_id: taskId,
        task_name: taskName,
        task_description: taskDescription,
        task_priority: taskPriority,
        status: status,
        due_date: dueDate
    });
};
```

- Delete Skills and Role Tag

* Delete Skills Tag: Delete Skills and it dependency: skill_id from Team , employee_skills, team_skill_tag

```javascript
// Delete Skills Tag
const deleteSkillsTag = (skillId) => {
    db.skills.deleteOne({ skill_id: skillId });
    db.team.updateMany({}, { $pull: { team_skill_id: skillId } });
    db.employee_skills.deleteMany({ skill_id: skillId });
    db.team_skill_tag.deleteMany({ skill_id: skillId });
};
```

- Delete Role Tag: Delete a Role and its dependency like role_id from team_member

```javascript
// Delete Role Tag
const deleteRoleTag = (roleId) => {
    db.role.deleteOne({ role_id: roleId });
    db.team_member.updateMany({}, { $pull: { role_id: roleId } });
};
```

**Testing**
```javascript
// Testing the functions
addSkillsTag('Python', 'A high-level programming language known for its simplicity and readability.');
addSkillsTag('JavaScript', 'A programming language that enables interactive web pages and dynamic content.');
addRoleTag('Developer', 'Responsible for writing code and implementing software solutions.');
addRoleTag('Tester', 'Responsible for testing software applications to ensure quality and functionality.');
addTask('Design homepage', 'Design the main page of the website', 'High', 'Pending', '2023-01-10');
editSkillsTag(1, 'Python Programming', 'A versatile programming language used in various domains.');
editRoleTag(1, 'Software Developer', 'Responsible for designing, developing, and maintaining software applications.');
deleteSkillsTag(2);
deleteRoleTag(1);

// Viewing skills and role tags after modifications
const updatedSkills = viewSkillsTag();
const updatedRoles = viewRoleTag();

// Printing updated skills and role tags
printjson(updatedSkills);
printjson(updatedRoles);
```

### Employees

**Manage Employee**

- Insert Employee

```javascript
// Insert Employee
const insertEmployee = (firstName, lastName, email, phoneNumber, address, birthDate, hireDate) => {
    const employeeId = getNextSequenceValue("employee_id");
    db.employee.insertOne({
        employee_id: employeeId,
        first_name: firstName,
        last_name: lastName,
        email: email,
        phone_number: phoneNumber,
        address: address,
        birth_date: birthDate,
        hire_date: hireDate
    });
};
```

- View Employee

```javascript
// View Employee
const viewEmployee = () => {
    return db.employee.find().toArray();
};
```

- Edit Employee

```javascript
// Function to edit an employee
const editEmployee = (employeeId, updatedFields) => {
    db.employee.updateOne(
        { _id: employeeId },
        {
            $set: {
                first_name: updatedFields.first_name,
                last_name: updatedFields.last_name,
                email: updatedFields.email,
                phone_number: updatedFields.phone_number,
                address: updatedFields.address,
                birth_date: updatedFields.birth_date,
                hire_date: updatedFields.hire_date,
                employee_skills: updatedFields.employee_skills,
                team_task: updatedFields.team_task,
                team_member: updatedFields.team_member
            }
        }
    );
};
```

- Delete Employee

```javascript
// Function to delete an employee
const deleteEmployee = (employeeId) => {
    // Remove employee from team_member
    db.team_member.deleteMany({ employee_id: employeeId });
    // Remove employee from employee_skills
    db.employee_skills.deleteMany({ employee_id: employeeId });
    // Delete the employee
    db.employee.deleteOne({ _id: employeeId });
};
```

### Team

**Manage Team**

- Insert Team

```javascript
// Insert Team
const insertTeam = (teamName, teamSkillId, teamLeadId, teamStatus) => {
    const teamId = getNextSequenceValue("team_id");
    db.Team.insertOne({
        team_id: teamId,
        team_name: teamName,
        team_skill_id: teamSkillId,
        team_lead_id: teamLeadId,
        team_status: teamStatus
    });
};
```

- View Team

```javascript
// View Team
const viewTeam = () => {
    return db.Team.find().toArray();
};
```

- Edit Team

```javascript
// Edit Team
const editTeam = (teamId, updatedFields) => {
    db.Team.updateOne(
        { team_id: teamId },
        {
            $set: {
                team_name: updatedFields.team_name,
                team_skill_id: updatedFields.team_skill_id,
                team_lead_id: updatedFields.team_lead_id,
                team_status: updatedFields.team_status
            }
        }
    );
};
```

- Delete Team
- ? Change Team status to Deactive instead of Delete (since Team hold many contraint and valuable infomation)
```javascript
// Change Team status to Deactive (instead of Delete)
const deactivateTeam = (teamId) => {
    db.Team.updateOne(
        { team_id: teamId },
        { $set: { team_status: "Inactive" } }
    );
};
```

### Task

- Create

```javascript
// Create Task
const createTask = (taskName, taskDescription, taskPriority, status, dueDate) => {
    const taskId = getNextSequenceValue("task_id");
    db.Task.insertOne({
        task_id: taskId,
        task_name: taskName,
        task_description: taskDescription,
        task_priority: taskPriority,
        status: status,
        due_date: dueDate
    });
};
```

- Add Task to Team (project_manager create overview task and assign to team)

```javascript
// Add Task to Team
const addTaskToTeam = (teamId, taskId) => {
    db.team_task.insertOne({
        team_id: teamId,
        task_id: taskId
    });
};
```

- Read

* Add

- Update

```javascript
// Update Task
const updateTask = (taskId, updatedFields) => {
    db.Task.updateOne(
        { task_id: taskId },
        {
            $set: {
                task_name: updatedFields.task_name,
                task_description: updatedFields.task_description,
                task_priority: updatedFields.task_priority,
                status: updatedFields.status,
                due_date: updatedFields.due_date
            }
        }
    );
};
```

- Delete: Delete a Task and its dependency like task_id from team_task

```javascript
const deleteTask = (taskId) => {
    db.Task.deleteOne({ task_id: taskId });
    db.team_task.deleteMany({ task_id: taskId });
};
```

### Project

**Manage Project**

- Insert Project

```javascript
// Insert Project
const insertProject = (projectName, goal, numberOfEmployees, projectPriority, projectStatus, startDate, endDate, projectManagerId) => {
    const projectId = getNextSequenceValue("project_id");
    db.Project.insertOne({
        project_id: projectId,
        name: projectName,
        goal: goal,
        number_of_employees: numberOfEmployees,
        project_priority: projectPriority,
        project_status: projectStatus,
        start_date: startDate,
        end_date: endDate,
        project_manager_id: projectManagerId
    });
};
```

- View Project

```javascript
// View Project
const viewProject = () => {
    return db.Project.find().toArray();
};
```

- Edit Project

```javascript
// Edit Project
const editProject = (projectId, updatedFields) => {
    db.Project.updateOne(
        { project_id: projectId },
        {
            $set: {
                name: updatedFields.name,
                goal: updatedFields.goal,
                number_of_employees: updatedFields.number_of_employees,
                project_priority: updatedFields.project_priority,
                project_status: updatedFields.project_status,
                start_date: updatedFields.start_date,
                end_date: updatedFields.end_date,
                project_manager_id: updatedFields.project_manager_id
            }
        }
    );
};
```

- Deactivate Project: Change Project status to Deactive instead of Delete (since Project hold many contraint and valuable infomation)

```javascript
// Deactivate Project (Change Project status to Deactive)
const deactivateProject = (projectId) => {
    db.Project.updateOne(
        { project_id: projectId },
        { $set: { project_status: "Inactive" } }
    );
};
```

- ? Set Project to project_priority

```javascript
// Set Project priority
const setProjectPriority = (projectId, priority) => {
    db.Project.updateOne(
        { project_id: projectId },
        { $set: { project_priority: priority } }
    );
};
```

- ? Update start_date and Update end_date

```javascript
// Update start_date and end_date of Project
const updateProjectDates = (projectId, startDate, endDate) => {
    db.Project.updateOne(
        { project_id: projectId },
        { $set: { start_date: startDate, end_date: endDate } }
    );
};
```

### NO-SQL to SQL Specical Features (Procedure, Trigger)

#### Procedures ???

- ? Team Features: View Employee through Skill Tag

```javascript
// View Employee through Skill Tag
const viewEmployeeBySkillTag = (skillId) => {
    return db.employee_skills.aggregate([
        {
            $match: { skill_id: skillId }
        },
        {
            $lookup: {
                from: "Employee",
                localField: "employee_id",
                foreignField: "employee_id",
                as: "employee"
            }
        },
        {
            $unwind: "$employee"
        },
        {
            $project: {
                _id: 0,
                employee_id: "$employee.employee_id",
                first_name: "$employee.first_name",
                last_name: "$employee.last_name",
                email: "$employee.email"
            }
        }
    ]).toArray();
};
```

- ? Project Procedure: Skill needed for a Project

```javascript
// Skill needed for a Project
const getSkillsForProject = (projectId) => {
    return db.project_prefer_skills.aggregate([
        {
            $match: { project_id: projectId }
        },
        {
            $lookup: {
                from: "Skills",
                localField: "skill_id",
                foreignField: "skill_id",
                as: "skill"
            }
        },
        {
            $unwind: "$skill"
        },
        {
            $project: {
                _id: 0,
                skill_id: "$skill.skill_id",
                skill_name: "$skill.skill_name",
                skill_description: "$skill.skill_description"
            }
        }
    ]).toArray();
};
```

- ? Project Procedure: Team in a Project

```javascript
db.projects.aggregate([
  { $match: { _id: ObjectId("projectID") } },
  {
    $lookup: {
      from: "teams",
      localField: "_id",
      foreignField: "project",
      as: "teams",
    },
  },
  { $unwind: "$teams" },
  { $project: { "teams.team_name": 1 } },
]);
```

- ? Team Procedure: Employees on a Team with Specific Skill

```javascript
const getEmployeesOnTeamWithSpecificSkill = (teamId, skillId) => {
    return db.team_member.aggregate([
        {
            $match: { team_id: teamId }
        },
        {
            $lookup: {
                from: "employee_skills",
                localField: "employee_id",
                foreignField: "employee_id",
                as: "employee_skills"
            }
        },
        {
            $unwind: "$employee_skills"
        },
        {
            $match: { "employee_skills.skill_id": skillId }
        },
        {
            $lookup: {
                from: "Employee",
                localField: "employee_id",
                foreignField: "employee_id",
                as: "employee"
            }
        },
        {
            $unwind: "$employee"
        },
        {
            $project: {
                _id: 0,
                employee_id: "$employee.employee_id",
                first_name: "$employee.first_name",
                last_name: "$employee.last_name",
                email: "$employee.email"
            }
        }
    ]).toArray();
};
```

- ? Team Procedure: Display Teams by Skill ID

```javascript
const getTeamsBySkillId = (skillId) => {
    return db.team_skill_tag.aggregate([
        {
            $match: { skill_id: skillId }
        },
        {
            $lookup: {
                from: "Team",
                localField: "team_id",
                foreignField: "team_id",
                as: "team"
            }
        },
        {
            $unwind: "$team"
        },
        {
            $project: {
                _id: 0,
                team_id: "$team.team_id",
                team_name: "$team.team_name",
                team_status: "$team.team_status"
            }
        }
    ]).toArray();
};
```

- ? Display Employees by Team Skill Tag

```javascript
const getEmployeesByTeamSkillTag = (teamId, skillId) => {
    return db.team_member.aggregate([
        {
            $match: { team_id: teamId }
        },
        {
            $lookup: {
                from: "employee_skills",
                localField: "employee_id",
                foreignField: "employee_id",
                as: "employee_skills"
            }
        },
        {
            $unwind: "$employee_skills"
        },
        {
            $match: { "employee_skills.skill_id": skillId }
        },
        {
            $lookup: {
                from: "Employee",
                localField: "employee_id",
                foreignField: "employee_id",
                as: "employee"
            }
        },
        {
            $unwind: "$employee"
        },
        {
            $project: {
                _id: 0,
                employee_id: "$employee.employee_id",
                first_name: "$employee.first_name",
                last_name: "$employee.last_name",
                email: "$employee.email"
            }
        }
    ]).toArray();
};
```

- ? Display Employees by Skill Tag and Which Team they in

```javascript
const getEmployeesBySkillTagAndTeam = (skillId) => {
    return db.team_member.aggregate([
        {
            $lookup: {
                from: "employee_skills",
                localField: "employee_id",
                foreignField: "employee_id",
                as: "employee_skills"
            }
        },
        {
            $unwind: "$employee_skills"
        },
        {
            $match: { "employee_skills.skill_id": skillId }
        },
        {
            $lookup: {
                from: "Employee",
                localField: "employee_id",
                foreignField: "employee_id",
                as: "employee"
            }
        },
        {
            $unwind: "$employee"
        },
        {
            $lookup: {
                from: "Team",
                localField: "team_id",
                foreignField: "team_id",
                as: "team"
            }
        },
        {
            $unwind: "$team"
        },
        {
            $project: {
                _id: 0,
                employee_id: "$employee.employee_id",
                first_name: "$employee.first_name",
                last_name: "$employee.last_name",
                email: "$employee.email",
                team_id: "$team.team_id",
                team_name: "$team.team_name"
            }
        }
    ]).toArray();
};
```

#### Triggers

- ? Trigger: Update Project 'number_of_employees'
```javascript
exports = function(changeEvent) {
  const db = context.services.get("mongodb-atlas").db("your_database_name");
  const projectsCollection = db.collection("Project");
  const teamProjectCollection = db.collection("team_project");
  
  const projectId = changeEvent.fullDocument.project_id;
  const newNumberOfEmployees = teamProjectCollection.countDocuments({ project_id: projectId });

  projectsCollection.updateOne(
    { project_id: projectId },
    { $set: { number_of_employees: newNumberOfEmployees } }
  );
};
```

- Trigger: Update Project 'number_of_employees' - When Employee Added to the Team Project
```javascript
exports = function(changeEvent) {
  const db = context.services.get("mongodb-atlas").db("your_database_name");
  const projectsCollection = db.collection("Project");
  const teamProjectCollection = db.collection("team_project");

  const projectId = changeEvent.fullDocument.project_id;
  const newNumberOfEmployees = teamProjectCollection.countDocuments({ project_id: projectId });

  projectsCollection.updateOne(
    { project_id: projectId },
    { $set: { number_of_employees: newNumberOfEmployees } }
  );
};
```

- Trigger: Update Project 'number_of_employees' - When Project Updated (e.g., end_date changed)
```javascript
exports = function(changeEvent) {
  const db = context.services.get("mongodb-atlas").db("your_database_name");
  const projectsCollection = db.collection("Project");
  const teamProjectCollection = db.collection("team_project");

  const projectId = changeEvent.fullDocument.project_id;
  const newNumberOfEmployees = teamProjectCollection.countDocuments({ project_id: projectId });

  projectsCollection.updateOne(
    { project_id: projectId },
    { $set: { number_of_employees: newNumberOfEmployees } }
  );
};
```

- Trigger: Update Project 'number_of_employees' - When Team Removed from Project
```javascript
exports = function(changeEvent) {
  const db = context.services.get("mongodb-atlas").db("your_database_name");
  const projectsCollection = db.collection("Project");
  const teamProjectCollection = db.collection("team_project");

  const projectId = changeEvent.fullDocument.project_id;
  const newNumberOfEmployees = teamProjectCollection.countDocuments({ project_id: projectId });

  projectsCollection.updateOne(
    { project_id: projectId },
    { $set: { number_of_employees: newNumberOfEmployees } }
  );
};
```
