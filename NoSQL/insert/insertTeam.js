db.Team.insertMany([
  {
    _id: ObjectId(),
    team_id: 1,
    team_name: "Web Development Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Web Development" })
      .skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Michael",
      last_name: "Johnson",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 2,
    team_name: "Testing Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Tester" }).skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Emily",
      last_name: "Davis",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 3,
    team_name: "Marketing Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Marketing" }).skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "David",
      last_name: "Wilson",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 4,
    team_name: "Backend Development Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Backend Development" })
      .skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Christopher",
      last_name: "Brown",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 5,
    team_name: "Data Science Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Data Science" }).skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Sarah",
      last_name: "Anderson",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 6,
    team_name: "Mobile Development Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Mobile Development" })
      .skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Sarah",
      last_name: "Smith",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 7,
    team_name: "Database Administration Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Database Administration" })
      .skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "David",
      last_name: "Wilson",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 8,
    team_name: "UI/UX Design Team",
    team_skill_id: db.Skills.findOne({ skill_name: "UI/UX Design" }).skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Emily",
      last_name: "Davis",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 9,
    team_name: "Embedded Systems Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Embedded Systems" })
      .skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Christopher",
      last_name: "Brown",
    }).employee_id,
    team_status: "Active",
  },
  {
    _id: ObjectId(),
    team_id: 10,
    team_name: "Cloud Computing Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Cloud Computing" })
      .skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Michael",
      last_name: "Johnson",
    }).employee_id,
    team_status: "Active",
  },
]);
