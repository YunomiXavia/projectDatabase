db.Employee.aggregate([
  {
    $lookup: {
      from: "Project",
      localField: "employee_id",
      foreignField: "project_manager_id",
      as: "projects",
    },
  },
  {
    $lookup: {
      from: "Team",
      localField: "employee_id",
      foreignField: "team_lead_id",
      as: "teams",
    },
  },
  {
    $lookup: {
      from: "employee_skills",
      localField: "employee_id",
      foreignField: "employee_id",
      as: "skills",
    },
  },
  {
    $lookup: {
      from: "team_member",
      localField: "employee_id",
      foreignField: "member_id",
      as: "team_memberships",
    },
  },
  {
    $lookup: {
      from: "Skills",
      localField: "skills.skill_id",
      foreignField: "skill_id",
      as: "skill_details",
    },
  },
  {
    $lookup: {
      from: "Role",
      localField: "team_memberships.role_id",
      foreignField: "role_id",
      as: "role_details",
    },
  },
  {
    $lookup: {
      from: "Team",
      localField: "team_memberships.team_id",
      foreignField: "team_id",
      as: "team_details",
    },
  },
  {
    $project: {
      _id: 0,
      employee_id: "$employee_id",
      first_name: "$first_name",
      last_name: "$last_name",
      email: "$email",
      hire_date: "$hire_date",
      projects: {
        $map: {
          input: "$projects",
          as: "project",
          in: {
            project_id: "$$project.project_id",
            name: "$$project.name",
            goal: "$$project.goal",
            start_date: "$$project.start_date",
            end_date: "$$project.end_date",
          },
        },
      },
      teams: {
        $map: {
          input: "$teams",
          as: "team",
          in: {
            team_id: "$$team.team_id",
            team_name: "$$team.team_name",
            team_status: "$$team.team_status",
          },
        },
      },
      skills: {
        $map: {
          input: "$skills",
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
      roles: {
        $map: {
          input: "$team_memberships",
          as: "membership",
          in: {
            role_id: "$$membership.role_id",
            role_name: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$role_details",
                    as: "detail",
                    in: "$$detail.role_name",
                  },
                },
                0,
              ],
            },
          },
        },
      },
      teams_info: {
        $map: {
          input: "$team_memberships",
          as: "membership",
          in: {
            team_id: "$$membership.team_id",
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
