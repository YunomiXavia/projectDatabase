db.Task.aggregate([
  {
    $lookup: {
      from: "team_task",
      localField: "task_id",
      foreignField: "task_id",
      as: "teams_with_task",
    },
  },
  {
    $project: {
      _id: 0,
      task_id: 1,
      task_name: 1,
      task_description: 1,
      task_priority: 1,
      status: 1,
      due_date: 1,
      teams_with_task: { $size: "$teams_with_task" },
    },
  },
]);
