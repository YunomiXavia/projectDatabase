db.Role.aggregate([
  {
    $lookup: {
      from: "team_member",
      localField: "role_id",
      foreignField: "role_id",
      as: "team_members",
    },
  },
  {
    $project: {
      _id: 0,
      role_id: 1,
      role_name: 1,
      team_members: {
        member_id: 1,
        team_id: 1,
      },
    },
  },
]);
