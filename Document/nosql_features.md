# NO-SQL Features Document

## NO-SQL Basic Features (CRUD - Create, Read, Update, Delete)

### Tag, Role

**Manage Tag, Role**

- Insert Skill and Role Tag and Task:

* Add Skills Tag:

```javascript
// Lấy id mới cho skills
var newSkillsId =
  db.Skills.find().sort({ skill_id: -1 }).limit(1).toArray()[0].skill_id + 1;

// Thêm một skills mới với id mới
db.Skills.insertOne({
  skill_id: newSkillsId,
  skill_name: "Java",
  skill_description: "Programming language",
});
```

- Add Role Tag:

```javascript
// Lấy id mới cho role
var newRoleId =
  db.Role.find().sort({ role_id: -1 }).limit(1).toArray()[0].role_id + 1;

// Thêm một role mới với id mới
db.Role.insertOne({
  role_id: newRoleId,
  role_name: "Developer",
  role_description: "Software developer",
});
```

- Add Task:

```javascript
// Lấy id mới cho task
var newTaskId =
  db.Task.find().sort({ task_id: -1 }).limit(1).toArray()[0].task_id + 1;

// Thêm một task mới với id mới
db.Task.insertOne({
  task_id: newTaskId,
  task_name: "Code review",
  task_description: "Review the code changes",
  team_id: 1,
});
```

- View Skills and Role Tag and Task:

* View Skills Tag:

```javascript
db.Skills.find();
```

- View Role Tag:

```javascript
db.Role.find();
```

- Edit Skills and Role Tag and Task:

* Edit Skills Tag:

```javascript
// Sửa skills có id là 1
db.Skills.updateOne(
  { skill_id: 1 },
  {
    $set: {
      skill_name: "Python",
      skill_description: "High-level programming language",
    },
  }
);
```

- Edit Role Tag:

```javascript
// Sửa role có id là 1
db.Role.updateOne(
  { role_id: 1 },
  {
    $set: {
      role_name: "Senior Developer",
      role_description: "Senior software developer",
    },
  }
);
```

- Delete Skills and Role Tag

* Delete Skills Tag: Delete Skills and it dependency: skill_id from Team , employee_skills, team_skill_tag

```javascript
// Xóa skills có id là 1
db.Skills.deleteOne({ skill_id: 1 });

// Xóa role có id là 1
db.Role.deleteOne({ role_id: 1 });
```

- Delete Role Tag: Delete a Role and its dependency like role_id from team_member

```javascript
// Xóa role có id là 1
db.Role.deleteOne({ role_id: 1 });

// Xóa các team_member có role_id là 1
db.team_member.deleteMany({ role_id: 1 });
```

### Employees

**Manage Employee**

- Insert Employee

```javascript
// Lấy id mới cho employee
var newEmployeeId =
  db.Employee.find().sort({ employee_id: -1 }).limit(1).toArray()[0]
    .employee_id + 1;

// Thêm một employee mới với id mới
db.Employee.insertOne({
  employee_id: newEmployeeId,
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@example.com",
  hire_date: new Date(),
});
```

- View Employee

```javascript
// View Employee
db.Employee.find();
```

- Edit Employee

```javascript
// Sửa thông tin của employee có id là 1
db.Employee.updateOne(
  { employee_id: 1 },
  {
    $set: {
      first_name: "Jane",
      last_name: "Doe",
      email: "jane.doe@example.com",
    },
  }
);
```

- Delete Employee

```javascript
// Xóa employee có id là 1
db.Employee.deleteOne({ employee_id: 1 });
```

### Team

**Manage Team**

- Insert Team

```javascript
// Lấy id mới cho team
var newTeamId =
  db.Team.find().sort({ team_id: -1 }).limit(1).toArray()[0].team_id + 1;

// Thêm một team mới với id mới
db.Team.insertOne({
  team_id: newTeamId,
  team_name: "Development Team",
  team_status: "Active",
});
```

- View Team

```javascript
db.Team.find();
```

- Edit Team

```javascript
// Sửa thông tin của team có id là 1
db.Team.updateOne({ team_id: 1 }, { $set: { team_name: "Design Team" } });
```

- Delete Team
- ? Change Team status to Deactive instead of Delete (since Team hold many contraint and valuable infomation)

```javascript
// Sửa trạng thái của team có id là 1 từ "Active" thành "Inactive"
db.Team.updateOne({ team_id: 1 }, { $set: { team_status: "Inactive" } });
```

### Task

- Create Task

```javascript
// Lấy id mới cho task
var newTaskId =
  db.Task.find().sort({ task_id: -1 }).limit(1).toArray()[0].task_id + 1;

// Thêm một task mới với id mới
db.Task.insertOne({
  task_id: newTaskId,
  task_name: "Implement Feature X",
  task_description: "Implement feature X in the application",
  status: "Pending",
  due_date: new Date(),
  project_id: 1,
});
```

- Add Task to Team (project_manager create overview task and assign to team)

```javascript
// Lấy id mới cho team_task
var newTeamTaskId =
  db.team_task.find().sort({ team_task_id: -1 }).limit(1).toArray()[0]
    .team_task_id + 1;

// Thêm một task vào team với id mới
db.team_task.insertOne({ team_task_id: newTeamTaskId, team_id: 1, task_id: 1 });
```

- Read

* Add

- Update Task

```javascript
// Sửa thông tin của task có id là 1
db.Task.updateOne(
  { task_id: 1 },
  {
    $set: {
      task_description: "Implement feature X in the application (update)",
    },
  }
);
```

- Delete: Delete a Task and its dependency like task_id from team_task

```javascript
// Xóa task có id là 1
db.Task.deleteOne({ task_id: 1 });

// Xóa các team_task có task_id là 1
db.team_task.deleteMany({ task_id: 1 });
```

### Project

**Manage Project**

- Insert Project

```javascript
// Lấy id mới cho project
var newProjectId =
  db.Project.find().sort({ project_id: -1 }).limit(1).toArray()[0].project_id +
  1;

// Thêm một project mới với id mới
db.Project.insertOne({
  project_id: newProjectId,
  name: "New Project",
  goal: "Develop a new software application",
  project_status: "Pending",
  start_date: new Date(),
});
```

- View Project

```javascript
db.Project.find();
```

- Edit Project

```javascript
// Sửa thông tin của project có id là 1
db.Project.updateOne(
  { project_id: 1 },
  { $set: { name: "Updated Project", goal: "Updated goal description" } }
);
```

- Deactivate Project: Change Project status to Deactive instead of Delete (since Project hold many contraint and valuable infomation)

```javascript
// Sửa trạng thái của project có id là 1 từ "Pending" thành "Inactive"
db.Project.updateOne(
  { project_id: 1 },
  { $set: { project_status: "Inactive" } }
);
```

- ? Set Project to project_priority

```javascript
// Sửa trạng thái của project có id là 1 thành "High" priority
db.Project.updateOne({ project_id: 1 }, { $set: { project_priority: "High" } });
```

- ? Update start_date and Update end_date

```javascript
// Cập nhật ngày bắt đầu và ngày kết thúc của project có id là 1
db.Project.updateOne(
  { project_id: 1 },
  {
    $set: {
      start_date: new Date("2024-05-01"),
      end_date: new Date("2024-12-31"),
    },
  }
);
```

### NO-SQL to SQL Specical Features (Procedure, Trigger)

#### Procedures ???

- ? Team Features: View Employee through Skill Tag

Mô tả: Hiển thị các nhân viên thông qua nhãn kỹ năng.

```javascript
db.Employee.aggregate([
  {
    $lookup: {
      from: "employee_skills",
      localField: "employee_id",
      foreignField: "employee_id",
      as: "employee_skills",
    },
  },
  {
    $unwind: "$employee_skills",
  },
  {
    $lookup: {
      from: "Skills",
      localField: "employee_skills.skill_id",
      foreignField: "skill_id",
      as: "skills",
    },
  },
  {
    $project: {
      first_name: 1,
      last_name: 1,
      email: 1,
      "skills.skill_name": 1,
    },
  },
]);
```

- ? Project Procedure: Skill needed for a Project

Mô tả: Kỹ năng cần thiết cho một dự án cụ thể.

```javascript
var projectId = 1; // Thay đổi projectId tùy theo dự án muốn xem
db.project_prefer_skills.aggregate([
  {
    $match: { project_id: projectId },
  },
  {
    $lookup: {
      from: "Skills",
      localField: "skill_id",
      foreignField: "skill_id",
      as: "skills",
    },
  },
  {
    $project: {
      "skills.skill_name": 1,
      "skills.skill_description": 1,
    },
  },
]);
```

- ? Project Procedure: Team in a Project

Mô tả: Hiển thị các team trong một dự án.

```javascript
var projectId = 1; // Thay đổi projectId tùy theo dự án muốn xem
db.team_project.aggregate([
  {
    $match: { project_id: projectId },
  },
  {
    $lookup: {
      from: "Team",
      localField: "team_id",
      foreignField: "team_id",
      as: "teams",
    },
  },
  {
    $project: {
      "teams.team_name": 1,
      "teams.team_status": 1,
    },
  },
]);
```

- ? Team Procedure: Employees on a Team with Specific Skill

Mô tả: Nhân viên trong một team có kỹ năng cụ thể.

```javascript
var teamId = 1; // Thay đổi teamId tùy theo team muốn xem
var skillId = 1; // Thay đổi skillId tùy theo kỹ năng muốn xem
db.team_member.aggregate([
  {
    $match: { team_id: teamId },
  },
  {
    $lookup: {
      from: "employee_skills",
      localField: "member_id",
      foreignField: "employee_id",
      as: "employee_skills",
    },
  },
  {
    $unwind: "$employee_skills",
  },
  {
    $match: { "employee_skills.skill_id": skillId },
  },
  {
    $lookup: {
      from: "Employee",
      localField: "member_id",
      foreignField: "employee_id",
      as: "employees",
    },
  },
  {
    $project: {
      "employees.first_name": 1,
      "employees.last_name": 1,
      "employees.email": 1,
    },
  },
]);
```

- ? Team Procedure: Display Teams by Skill ID

Mô tả: Hiển thị các team dựa trên ID kỹ năng.

```javascript
var skillId = 1; // Thay đổi skillId tùy theo kỹ năng muốn xem
db.team_skill_tag.aggregate([
  {
    $match: { skill_id: skillId },
  },
  {
    $lookup: {
      from: "Team",
      localField: "team_id",
      foreignField: "team_id",
      as: "teams",
    },
  },
  {
    $project: {
      "teams.team_name": 1,
      "teams.team_status": 1,
    },
  },
]);
```

- ? Display Employees by Team Skill Tag

Mô tả: Hiển thị các nhân viên dựa trên nhãn kỹ năng của team.

```javascript
var teamId = 1; // Thay đổi teamId tùy theo team muốn xem
db.team_skill_tag.aggregate([
  {
    $match: { team_id: teamId },
  },
  {
    $lookup: {
      from: "employee_skills",
      localField: "skill_id",
      foreignField: "skill_id",
      as: "employee_skills",
    },
  },
  {
    $lookup: {
      from: "Employee",
      localField: "employee_skills.employee_id",
      foreignField: "employee_id",
      as: "employees",
    },
  },
  {
    $project: {
      "employees.first_name": 1,
      "employees.last_name": 1,
      "employees.email": 1,
    },
  },
]);
```

- ? Display Employees by Skill Tag and Which Team they in

Mô tả: Hiển thị các nhân viên dựa trên nhãn kỹ năng và team mà họ thuộc về.

```javascript
var skillId = 1; // Thay đổi skillId tùy theo kỹ năng muốn xem
db.employee_skills.aggregate([
  {
    $match: { skill_id: skillId },
  },
  {
    $lookup: {
      from: "team_member",
      localField: "employee_id",
      foreignField: "member_id",
      as: "team_members",
    },
  },
  {
    $lookup: {
      from: "Team",
      localField: "team_members.team_id",
      foreignField: "team_id",
      as: "teams",
    },
  },
  {
    $lookup: {
      from: "Employee",
      localField: "employee_id",
      foreignField: "employee_id",
      as: "employees",
    },
  },
  {
    $project: {
      "employees.first_name": 1,
      "employees.last_name": 1,
      "employees.email": 1,
      "teams.team_name": 1,
    },
  },
]);
```

? View Total employee count in a project by project_id

? Description: This procedure retrieves the total count of distinct employees involved in the teams of a specific project.

```javascript
var projectId = 1; // Thay đổi projectId tùy theo dự án muốn xem

db.team_project.aggregate([
  {
    $match: { project_id: projectId },
  },
  {
    $lookup: {
      from: "team_member",
      localField: "team_id",
      foreignField: "team_id",
      as: "team_members",
    },
  },
  {
    $group: {
      _id: null,
      totalEmployees: { $sum: { $size: "$team_members" } },
    },
  },
]);
```

? Update total employee count in a project by
? Use this procedure with the project_id to update the number_of_employees in the Project table
? To update when a employee join or leave a team, get the count of distinct employees in the project's teams and update the number_of_employees in the Project table

```javascript
var projectId = 1; // Thay đổi projectId tùy theo dự án cần cập nhật

// Tính lại số lượng nhân viên trong dự án
var totalEmployees = db.team_project
  .aggregate([
    {
      $match: { project_id: projectId },
    },
    {
      $lookup: {
        from: "team_member",
        localField: "team_id",
        foreignField: "team_id",
        as: "team_members",
      },
    },
    {
      $group: {
        _id: null,
        totalEmployees: { $sum: { $size: "$team_members" } },
      },
    },
  ])
  .toArray()[0].totalEmployees;

// Cập nhật số lượng nhân viên trong dự án
db.Project.updateOne(
  { project_id: projectId },
  { $set: { number_of_employees: totalEmployees } }
);
```

#### Triggers

? Trigger Delete from Employee
? Description: This trigger is used to delete an employee and cascade the deletion to related tables.

```javascript
var employeeIdToDelete = 1; // Thay đổi employeeIdToDelete tùy theo nhân viên muốn xóa

// Xóa bản ghi của nhân viên từ bảng Employee
db.Employee.deleteOne({ employee_id: employeeIdToDelete });

// Xóa bản ghi của nhân viên từ bảng employee_skills
db.employee_skills.deleteMany({ employee_id: employeeIdToDelete });

// Xóa bản ghi của nhân viên từ bảng team_member
db.team_member.deleteMany({ member_id: employeeIdToDelete });
```

? Trigger Delete from Skills

```javascript
var roleIdToDelete = 1; // Thay đổi roleIdToDelete tùy theo vai trò muốn xóa

// Xóa bản ghi của vai trò từ bảng Role
db.Role.deleteOne({ role_id: roleIdToDelete });

// Xóa bản ghi của vai trò từ bảng team_member
db.team_member.deleteMany({ role_id: roleIdToDelete });
```
