db.Task.insertMany([
  {
    _id: ObjectId(),
    task_id: 1,
    task_name: "Design homepage",
    task_description: "Design the main page of the website",
    task_priority: "High",
    status: "Pending",
    due_date: ISODate("2023-01-10"),
  },
  {
    _id: ObjectId(),
    task_id: 2,
    task_name: "Implement user authentication",
    task_description: "Implement user authentication feature",
    task_priority: "Medium",
    status: "In Progress",
    due_date: ISODate("2023-01-20"),
  },
  {
    _id: ObjectId(),
    task_id: 3,
    task_name: "Test mobile app",
    task_description: "Conduct thorough testing on different devices",
    task_priority: "High",
    status: "Pending",
    due_date: ISODate("2023-03-01"),
  },
  {
    _id: ObjectId(),
    task_id: 4,
    task_name: "Optimize database queries",
    task_description: "Improve the efficiency of database queries",
    task_priority: "Medium",
    status: "Pending",
    due_date: ISODate("2023-02-15"),
  },
  {
    _id: ObjectId(),
    task_id: 5,
    task_name: "Analyze customer data",
    task_description: "Extract insights from customer data",
    task_priority: "Low",
    status: "Completed",
    due_date: ISODate("2023-01-25"),
  },
  {
    _id: ObjectId(),
    task_id: 6,
    task_name: "Update product images",
    task_description: "Replace outdated product images with new ones",
    task_priority: "Medium",
    status: "Pending",
    due_date: ISODate("2023-02-05"),
  },
  {
    _id: ObjectId(),
    task_id: 7,
    task_name: "Write API documentation",
    task_description: "Document the endpoints and usage of the API",
    task_priority: "High",
    status: "In Progress",
    due_date: ISODate("2023-02-28"),
  },
  {
    _id: ObjectId(),
    task_id: 8,
    task_name: "Deploy website to production",
    task_description:
      "Deploy the latest version of the website to the production server",
    task_priority: "High",
    status: "Pending",
    due_date: ISODate("2023-03-10"),
  },
  {
    _id: ObjectId(),
    task_id: 9,
    task_name: "Conduct user feedback session",
    task_description:
      "Organize and conduct a session to gather feedback from users",
    task_priority: "Medium",
    status: "In Progress",
    due_date: ISODate("2023-02-15"),
  },
  {
    _id: ObjectId(),
    task_id: 10,
    task_name: "Update website layout",
    task_description:
      "Revise the layout of the website to improve user experience",
    task_priority: "High",
    status: "Pending",
    due_date: ISODate("2023-02-20"),
  },
  {
    _id: ObjectId(),
    task_id: 11,
    task_name: "Create weekly progress report",
    task_description:
      "Compile and send out a report detailing project progress",
    task_priority: "Low",
    status: "Pending",
    due_date: ISODate("2023-02-10"),
  },
  {
    _id: ObjectId(),
    task_id: 12,
    task_name: "Fix bugs reported by QA team",
    task_description: "Address and resolve bugs identified during QA testing",
    task_priority: "High",
    status: "In Progress",
    due_date: ISODate("2023-02-28"),
  },
  {
    _id: ObjectId(),
    task_id: 13,
    task_name: "Plan marketing campaign",
    task_description: "Develop a strategy for marketing the product or service",
    task_priority: "High",
    status: "Pending",
    due_date: ISODate("2023-03-15"),
  },
]);