// Chèn dữ liệu cho Web Developer Team
db.team_member.insertMany([
  {
    role_id: db.Role.findOne({ role_name: "Front-end Developer" }).role_id,
    member_id: db.Employee.findOne({
      first_name: "Michael",
      last_name: "Johnson",
    }).employee_id,
    team_id: db.Team.findOne({ team_name: "Web Development Team" }).team_id,
  },
  {
    role_id: db.Role.findOne({ role_name: "Back-end Developer" }).role_id,
    member_id: db.Employee.findOne({ first_name: "Emily", last_name: "Davis" })
      .employee_id,
    team_id: db.Team.findOne({ team_name: "Web Development Team" }).team_id,
  },
  {
    role_id: db.Role.findOne({ role_name: "Database Administrator" }).role_id,
    member_id: db.Employee.findOne({ first_name: "David", last_name: "Wilson" })
      .employee_id,
    team_id: db.Team.findOne({ team_name: "Web Development Team" }).team_id,
  },
  {
    role_id: db.Role.findOne({ role_name: "DevOps Engineer" }).role_id,
    member_id: db.Employee.findOne({
      first_name: "Christopher",
      last_name: "Brown",
    }).employee_id,
    team_id: db.Team.findOne({ team_name: "Web Development Team" }).team_id,
  },
  {
    role_id: db.Role.findOne({ role_name: "Project Manager" }).role_id,
    member_id: db.Employee.findOne({
      first_name: "Sarah",
      last_name: "Anderson",
    }).employee_id,
    team_id: db.Team.findOne({ team_name: "Web Development Team" }).team_id,
  },
  {
    role_id: 11,
    member_id: 2,
    team_id: 4,
  },
  {
    role_id: 12,
    member_id: 6,
    team_id: 2,
  },
  {
    role_id: 13,
    member_id: 7,
    team_id: 4,
  },
  {
    role_id: 11,
    member_id: 2,
    team_id: 7,
  },
  {
    role_id: 12,
    member_id: 10,
    team_id: 9,
  },
  {
    role_id: 22,
    member_id: 5,
    team_id: 2,
  },
]);
