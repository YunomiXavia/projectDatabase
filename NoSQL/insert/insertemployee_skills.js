db.employee_skills.insertMany([
  {
    employee_id: db.Employee.findOne({
      first_name: "Michael",
      last_name: "Johnson",
    }).employee_id,
    skill_id: db.Skills.findOne({ skill_name: "Python" }).skill_id,
  },
  {
    employee_id: db.Employee.findOne({
      first_name: "Michael",
      last_name: "Johnson",
    }).employee_id,
    skill_id: db.Skills.findOne({ skill_name: "Data Analysis" }).skill_id,
  },
  {
    employee_id: db.Employee.findOne({
      first_name: "Emily",
      last_name: "Davis",
    }).employee_id,
    skill_id: db.Skills.findOne({ skill_name: "JavaScript" }).skill_id,
  },
  {
    employee_id: db.Employee.findOne({
      first_name: "David",
      last_name: "Wilson",
    }).employee_id,
    skill_id: db.Skills.findOne({ skill_name: "Database Management" }).skill_id,
  },
  {
    employee_id: db.Employee.findOne({
      first_name: "Sarah",
      last_name: "Anderson",
    }).employee_id,
    skill_id: db.Skills.findOne({ skill_name: "Python" }).skill_id,
  },
  {
    employee_id: db.Employee.findOne({
      first_name: "Sarah",
      last_name: "Anderson",
    }).employee_id,
    skill_id: db.Skills.findOne({ skill_name: "Data Analysis" }).skill_id,
  },
  {
    employee_id: db.Employee.findOne({
      first_name: "Christopher",
      last_name: "Brown",
    }).employee_id,
    skill_id: db.Skills.findOne({ skill_name: "Python" }).skill_id,
  },
  {
    employee_id: 1, // For example, Employee 1 has 'Web Development' skill
    skill_id: 1,
  },
  {
    employee_id: 2, // For example, Employee 2 has 'Backend Development' skill
    skill_id: 9,
  },
]);
