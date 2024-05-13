db.Project.aggregate([
  {
    $lookup: {
      from: "Employee",
      localField: "project_manager_id",
      foreignField: "employee_id",
      as: "project_manager",
    },
  },
  {
    $lookup: {
      from: "project_prefer_skills",
      localField: "project_id",
      foreignField: "project_id",
      as: "prefer_skills",
    },
  },
  {
    $lookup: {
      from: "team_project",
      localField: "project_id",
      foreignField: "project_id",
      as: "teams",
    },
  },
  {
    $lookup: {
      from: "Skills",
      localField: "prefer_skills.skill_id",
      foreignField: "skill_id",
      as: "skill_details",
    },
  },
  {
    $lookup: {
      from: "Team",
      localField: "teams.team_id",
      foreignField: "team_id",
      as: "team_details",
    },
  },
  {
    $project: {
      _id: 0,
      project_id: 1,
      name: 1,
      goal: 1,
      start_date: 1,
      end_date: 1,
      project_manager: {
        $arrayElemAt: ["$project_manager", 0],
      },
      prefer_skills: {
        $map: {
          input: "$prefer_skills",
          as: "skill",
          in: {
            skill_id: "$$skill.skill_id",
            skill_name: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$skill_details",
                    as: "detail",
                    in: "$$detail.skill_name",
                  },
                },
                0,
              ],
            },
            skill_description: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$skill_details",
                    as: "detail",
                    in: "$$detail.skill_description",
                  },
                },
                0,
              ],
            },
          },
        },
      },
      teams: {
        $map: {
          input: "$teams",
          as: "team",
          in: {
            team_id: "$$team.team_id",
            team_name: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$team_details",
                    as: "detail",
                    in: "$$detail.team_name",
                  },
                },
                0,
              ],
            },
            team_status: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$team_details",
                    as: "detail",
                    in: "$$detail.team_status",
                  },
                },
                0,
              ],
            },
          },
        },
      },
    },
  },
]);
