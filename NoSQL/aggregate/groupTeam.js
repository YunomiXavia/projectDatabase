db.Team.aggregate([
  {
    $lookup: {
      from: "team_task",
      localField: "team_id",
      foreignField: "team_id",
      as: "tasks",
    },
  },
  {
    $lookup: {
      from: "team_skill_tag",
      localField: "team_id",
      foreignField: "team_id",
      as: "skill_tags",
    },
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
    $lookup: {
      from: "Employee",
      localField: "team_lead_id",
      foreignField: "employee_id",
      as: "team_lead",
    },
  },
  {
    $lookup: {
      from: "team_project",
      localField: "team_id",
      foreignField: "team_id",
      as: "projects",
    },
  },
  {
    $lookup: {
      from: "Skills",
      localField: "skill_tags.skill_id",
      foreignField: "skill_id",
      as: "skill_details",
    },
  },
  {
    $lookup: {
      from: "Project",
      localField: "projects.project_id",
      foreignField: "project_id",
      as: "project_details",
    },
  },
  {
    $lookup: {
      from: "Role",
      localField: "team_members.role_id",
      foreignField: "role_id",
      as: "role_details",
    },
  },
  {
    $project: {
      _id: 0,
      team_id: 1,
      team_name: 1,
      team_status: 1,
      tasks: {
        $map: {
          input: "$tasks",
          as: "task",
          in: {
            task_id: "$$task.task_id",
            task_name: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$task_details",
                    as: "detail",
                    in: "$$detail.task_name",
                  },
                },
                0,
              ],
            },
            task_description: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$task_details",
                    as: "detail",
                    in: "$$detail.task_description",
                  },
                },
                0,
              ],
            },
          },
        },
      },
      skills: {
        $map: {
          input: "$skill_tags",
          as: "tag",
          in: {
            skill_id: "$$tag.skill_id",
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
      team_lead: {
        $arrayElemAt: ["$team_lead", 0],
      },
      projects: {
        $map: {
          input: "$projects",
          as: "project",
          in: {
            project_id: "$$project.project_id",
            name: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$project_details",
                    as: "detail",
                    in: "$$detail.name",
                  },
                },
                0,
              ],
            },
            goal: {
              $arrayElemAt: [
                {
                  $map: {
                    input: "$project_details",
                    as: "detail",
                    in: "$$detail.goal",
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
          input: "$team_members",
          as: "member",
          in: {
            role_id: "$$member.role_id",
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
    },
  },
]);
