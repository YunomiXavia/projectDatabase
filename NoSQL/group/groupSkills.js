db.Skills.aggregate([
  {
    $lookup: {
      from: "employee_skills",
      localField: "skill_id",
      foreignField: "skill_id",
      as: "employees_with_skill",
    },
  },
  {
    $lookup: {
      from: "team_skill_tag",
      localField: "skill_id",
      foreignField: "skill_id",
      as: "teams_with_skill",
    },
  },
  {
    $lookup: {
      from: "Team",
      localField: "skill_id",
      foreignField: "team_skill_id",
      as: "teams",
    },
  },
  {
    $lookup: {
      from: "project_prefer_skills",
      localField: "skill_id",
      foreignField: "skill_id",
      as: "projects_with_skill",
    },
  },
  {
    $project: {
      _id: 0,
      skill_id: 1,
      skill_name: 1,
      employees_with_skill: { $size: "$employees_with_skill" },
      teams_with_skill: { $size: "$teams_with_skill" },
      teams: { $size: "$teams" },
      projects_with_skill: { $size: "$projects_with_skill" },
    },
  },
]);
