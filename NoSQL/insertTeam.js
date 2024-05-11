db.Team.insertMany([
  {
    _id: ObjectId(),
    team_name: "Web Development Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Web Development" })
      .team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Michael",
      last_name: "Johnson",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "Testing Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Tester" }).team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Emily",
      last_name: "Davis",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "Marketing Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Marketing" }).team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "David",
      last_name: "Wilson",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "Backend Development Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Backend Development" })
      .team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Christopher",
      last_name: "Brown",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "Data Science Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Data Science" })
      .team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Sarah",
      last_name: "Anderson",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "Mobile Development Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Mobile Development" })
      .team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Sarah",
      last_name: "Smith",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "Database Administration Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Database Administration" })
      .team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "David",
      last_name: "Wilson",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "UI/UX Design Team",
    team_skill_id: db.Skills.findOne({ skill_name: "UI/UX Design" })
      .team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Emily",
      last_name: "Davis",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "Embedded Systems Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Embedded Systems" })
      .team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Christopher",
      last_name: "Brown",
    }).team_lead_id,
  },
  {
    _id: ObjectId(),
    team_name: "Cloud Computing Team",
    team_skill_id: db.Skills.findOne({ skill_name: "Cloud Computing" })
      .team_skill_id,
    team_lead_id: db.Employee.findOne({
      first_name: "Michael",
      last_name: "Johnson",
    }).team_lead_id,
  },
]);
