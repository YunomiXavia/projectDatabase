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

* Delete Skills Tag: Trigger to Delete Skills and it dependency: skill_id from Team , employee_skills, team_skill_tag

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
        { $set: updatedFields }
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
db.teams.insertOne({
  team_name: "Development Team",
  team_lead_id: ObjectId("employeeID"), // ID của người điều hành nhóm
  project: ObjectId("projectID"), // ID của dự án liên quan
  skill_team_id: [ObjectId("skillID1"), ObjectId("skillID2")], // Mảng chứa ID của các kỹ năng của nhóm
  members: [ObjectId("employeeID1"), ObjectId("employeeID2")], // Mảng chứa ID của các thành viên trong nhóm
});
```

- View Team

```javascript
db.teams.find();
```

- Edit Team

```javascript
// Lấy ID của Nhóm muốn chỉnh sửa
var teamIdToEdit = ObjectId("teamID");

// Chỉnh sửa thông tin của Nhóm
db.teams.updateOne(
  { _id: teamIdToEdit },
  {
    $set: {
      team_name: "New Team Name",
      team_lead_id: ObjectId("newLeadID"), // Cập nhật ID của người điều hành nhóm (nếu cần)
      project: ObjectId("newProjectID"), // Cập nhật ID của dự án liên quan (nếu cần)
      skill_team_id: [ObjectId("newSkillID1"), ObjectId("newSkillID2")], // Cập nhật kỹ năng của nhóm (nếu cần)
      members: [ObjectId("newMemberID1"), ObjectId("newMemberID2")], // Cập nhật thành viên của nhóm (nếu cần)
    },
  }
);
```

- Delete Team
- ? Change Team status to Deactive instead of Delete (since Team hold many contraint and valuable infomation)

```javascript
// Lấy ID của Nhóm muốn xóa
var teamIdToDelete = ObjectId("teamID");

// Xóa Nhóm
db.teams.deleteOne({ _id: teamIdToDelete });
```

### Task

- Create

```javascript
db.tasks.insertOne({
  task_name: "Develop login functionality",
  description: "Implement user login functionality for the website.",
  priority: 2, // Medium priority
  status: "Pending",
  start_date: new Date(),
  due_date: new Date("2024-06-30"),
  team_task: [], // Các nhóm được giao task (nếu có)
});
```

- Add Task to Team (project_manager create overview task and assign to team)

```javascript
// Lấy ID của Task và ID của Nhóm
var taskIdToAdd = ObjectId("taskID");
var teamIdToAddTaskTo = ObjectId("teamID");

// Thêm task vào team_task của nhóm
db.teams.updateOne(
  { _id: teamIdToAddTaskTo },
  {
    $addToSet: {
      team_task: taskIdToAdd,
    },
  }
);
```

- Read

* Add

- Update

```javascript
// Lấy ID của Task muốn cập nhật
var taskIdToUpdate = ObjectId("taskID");

// Cập nhật thông tin của Task
db.tasks.updateOne(
  { _id: taskIdToUpdate },
  {
    $set: {
      description:
        "Update login functionality with additional security measures.",
      priority: 1, // High priority
      status: "In Progress",
      due_date: new Date("2024-07-15"),
    },
  }
);
```

- Delete: Delete a Task and its dependency like task_id from team_task

```javascript
// Lấy ID của Task muốn xóa
var taskIdToDelete = ObjectId("taskID");

// Xóa Task
db.tasks.deleteOne({ _id: taskIdToDelete });

// Xóa phụ thuộc của Task trong team_task
db.teams.updateMany({}, { $pull: { team_task: taskIdToDelete } });
```

### Project

**Manage Project**

- Insert Project

```javascript
db.projects.insertOne({
  name: "New Project",
  goal: "Project goal description",
  number_of_employees: 0,
  priority: "High",
  status: "Pending",
  start_date: new Date(),
  end_date: new Date("2024-12-31"),
  project_manager: ObjectId("projectManagerID"), // ID của quản lý dự án
  project_team: [], // Mảng chứa ID của các nhóm tham gia dự án
});
```

- View Project

```javascript
db.projects.find();
```

- Edit Project

```javascript
// Lấy ID của Dự án muốn chỉnh sửa
var projectIdToUpdate = ObjectId("projectID");

// Cập nhật thông tin của Dự án
db.projects.updateOne(
  { _id: projectIdToUpdate },
  {
    $set: {
      name: "Updated Project Name",
      goal: "Updated project goal description",
      number_of_employees: 10, // Số lượng nhân viên tham gia (nếu cần)
      priority: "Medium", // Cập nhật mức độ ưu tiên
      status: "In Progress", // Cập nhật trạng thái
      start_date: new Date("2024-06-01"), // Cập nhật ngày bắt đầu
      end_date: new Date("2025-01-31"), // Cập nhật ngày kết thúc
      project_manager: ObjectId("newManagerID"), // Cập nhật quản lý dự án (nếu cần)
      project_team: [ObjectId("teamID1"), ObjectId("teamID2")], // Cập nhật các nhóm tham gia (nếu cần)
    },
  }
);
```

- Deactivate Project: Change Project status to Deactive instead of Delete (since Project hold many contraint and valuable infomation)

```javascript
// Lấy ID của Dự án muốn vô hiệu hóa
var projectIdToDeactivate = ObjectId("projectID");

// Cập nhật trạng thái của Dự án thành "Deactive"
db.projects.updateOne(
  { _id: projectIdToDeactivate },
  {
    $set: {
      status: "Deactive",
    },
  }
);
```

- ? Set Project to project_priority

```javascript
// Lấy ID của Dự án muốn đặt ưu tiên
var projectIdToSetPriority = ObjectId("projectID");

// Cập nhật mức độ ưu tiên của Dự án
db.projects.updateOne(
  { _id: projectIdToSetPriority },
  {
    $set: {
      priority: "High", // Hoặc "Medium", "Low"
    },
  }
);
```

- ? Update start_data and Update end_date

```javascript
// Lấy ID của Dự án muốn cập nhật ngày bắt đầu và kết thúc
var projectIdToUpdateDates = ObjectId("projectID");

// Cập nhật ngày bắt đầu và kết thúc của Dự án
db.projects.updateOne(
  { _id: projectIdToUpdateDates },
  {
    $set: {
      start_date: new Date("2024-07-01"),
      end_date: new Date("2025-03-31"),
    },
  }
);
```

### NO-SQL to SQL Specical Features (Procedure, Trigger)

#### Procedures ???

- ? Team Features: View Employee through Skill Tag

```javascript
db.employees.find({
  employee_skills: { $elemMatch: { $ref: "Skills", name: "JavaScript" } },
});
```

- ? Project Procedure: Skill needed for a Project

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
  {
    $lookup: {
      from: "skills",
      localField: "teams.skill_team_id",
      foreignField: "_id",
      as: "skills",
    },
  },
  { $unwind: "$skills" },
  { $group: { _id: "$_id", required_skills: { $addToSet: "$skills.name" } } },
]);
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
db.teams.aggregate([
  { $match: { _id: ObjectId("teamID") } },
  {
    $lookup: {
      from: "employees",
      localField: "members",
      foreignField: "_id",
      as: "employees",
    },
  },
  { $unwind: "$employees" },
  {
    $lookup: {
      from: "skills",
      localField: "employees.employee_skills",
      foreignField: "_id",
      as: "employee_skills",
    },
  },
  { $unwind: "$employee_skills" },
  { $match: { "employee_skills.name": "JavaScript" } },
]);
```

- ? Team Procedure: Display Teams by Skill ID

```javascript
db.teams.find({ skill_team_id: ObjectId("skillID") });
```

- ? Display Employees by Team Skill Tag

```javascript
db.teams.aggregate([
  { $match: { _id: ObjectId("teamID") } },
  {
    $lookup: {
      from: "employees",
      localField: "members",
      foreignField: "_id",
      as: "employees",
    },
  },
  { $unwind: "$employees" },
  {
    $lookup: {
      from: "skills",
      localField: "employees.employee_skills",
      foreignField: "_id",
      as: "employee_skills",
    },
  },
  { $unwind: "$employee_skills" },
  {
    $project: {
      "employees.first_name": 1,
      "employees.last_name": 1,
      "employees.email": 1,
      "employees.employee_skills": 1,
    },
  },
]);
```

- ? Display Employees by Skill Tag and Which Team they in

```javascript
db.employees.aggregate([
  {
    $lookup: {
      from: "teams",
      localField: "team_member",
      foreignField: "_id",
      as: "teams",
    },
  },
  { $unwind: "$teams" },
  {
    $lookup: {
      from: "skills",
      localField: "employee_skills",
      foreignField: "_id",
      as: "employee_skills",
    },
  },
  { $unwind: "$employee_skills" },
  { $match: { "employee_skills.name": "JavaScript" } },
]);
```

#### Triggers

- ? We Cannot perform an aggregate function on an expression containing an aggregate or a subquery.
- ? Trigger: Update Project 'number_of_employees' - On Progress

```javascript
// Assume projectID is the ID of the project you want to update
var projectID = ObjectId("projectID");

// Assume employeeID is the ID of the employee you want to add to the project
var employeeID = ObjectId("employeeID");

// Update the project by incrementing 'number_of_employees' by 1
db.projects.updateOne({ _id: projectID }, { $inc: { number_of_employees: 1 } });

// Then, add the employee to the project
db.projects.updateOne(
  { _id: projectID },
  { $push: { project_team: employeeID } }
);
```
