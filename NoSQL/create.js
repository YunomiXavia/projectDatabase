// Tạo bảng Employee
db.createCollection("Employee", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["first_name", "last_name", "email", "hire_date"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        employee_id: {
          bsonType: "int",
        },
        first_name: {
          bsonType: "string",
          maxLength: 30,
        },
        last_name: {
          bsonType: "string",
          maxLength: 30,
        },
        email: {
          bsonType: "string",
          pattern: "^\\S+@\\S+$",
          maxLength: 50,
        },
        phone_number: {
          bsonType: "string",
          maxLength: 15,
        },
        address: {
          bsonType: "string",
          maxLength: 75,
        },
        birth_date: {
          bsonType: "date",
        },
        hire_date: {
          bsonType: "date",
        },
      },
    },
  },
});

// Tạo bảng Project
db.createCollection("Project", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "goal", "start_date"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        project_id: {
          bsonType: "int",
        },
        name: {
          bsonType: "string",
          maxLength: 30,
        },
        goal: {
          bsonType: "string",
          maxLength: 50,
        },
        number_of_employees: {
          bsonType: "int",
        },
        project_priority: {
          enum: ["Low", "Medium", "High"],
        },
        project_status: {
          enum: ["Pending", "In Progress", "Completed"],
        },
        start_date: {
          bsonType: "date",
        },
        end_date: {
          bsonType: ["date", "null"],
        },
        project_manager_id: {
          bsonType: "int",
        },
      },
    },
  },
});

// Tạo bảng Task
db.createCollection("Task", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["task_name"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        task_id: {
          bsonType: "int",
        },
        task_name: {
          bsonType: "string",
          maxLength: 30,
        },
        task_description: {
          bsonType: "string",
          maxLength: 255,
        },
        task_priority: {
          enum: ["Low", "Medium", "High"],
        },
        status: {
          enum: ["Pending", "In Progress", "Completed"],
        },
        due_date: {
          bsonType: "date",
        },
      },
    },
  },
});
// Tạo bảng Skills
db.createCollection("Skills", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["skill_name"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        skill_id: {
          bsonType: "int",
        },
        skill_name: {
          bsonType: "string",
          maxLength: 50,
        },
        skill_description: {
          bsonType: "string",
          maxLength: 255,
        },
      },
    },
  },
});

// Tạo bảng Team
db.createCollection("Team", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["team_name", "team_status"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        team_id: {
          bsonType: "int",
        },
        team_name: {
          bsonType: "string",
          maxLength: 30,
        },
        team_skill_id: {
          bsonType: "int",
        },
        team_lead_id: {
          bsonType: "int",
        },
        team_status: {
          enum: ["Active", "Inactive"],
        },
      },
    },
  },
});

// Tạo bảng Role
db.createCollection("Role", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["role_name"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        role_id: {
          bsonType: "int",
        },
        role_name: {
          bsonType: "string",
          maxLength: 50,
        },
        role_description: {
          bsonType: "string",
          maxLength: 255,
        },
      },
    },
  },
});

// Tạo bảng team_task
db.createCollection("team_task", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["team_id", "task_id"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        team_id: {
          bsonType: "int",
        },
        task_id: {
          bsonType: "int",
        },
      },
    },
  },
});

// Tạo bảng team_skill_tag
db.createCollection("team_skill_tag", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["team_id", "skill_id"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        team_id: {
          bsonType: "int",
        },
        skill_id: {
          bsonType: "int",
        },
      },
    },
  },
});

// Tạo bảng project_prefer_skills
db.createCollection("project_prefer_skills", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["project_id", "skill_id"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        project_id: {
          bsonType: "int",
        },
        skill_id: {
          bsonType: "int",
        },
      },
    },
  },
});

// Tạo bảng team_project
db.createCollection("team_project", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["team_id", "project_id"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        team_id: {
          bsonType: "int",
        },
        project_id: {
          bsonType: "int",
        },
      },
    },
  },
});

// Tạo bảng team_member
db.createCollection("team_member", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["role_id", "member_id", "team_id"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        role_id: {
          bsonType: "int",
        },
        member_id: {
          bsonType: "int",
        },
        team_id: {
          bsonType: "int",
        },
      },
    },
  },
});

// Tạo bảng employee_skills
db.createCollection("employee_skills", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["employee_id", "skill_id"],
      properties: {
        _id: {
          bsonType: "objectId",
        },
        employee_id: {
          bsonType: "int",
        },
        skill_id: {
          bsonType: "int",
        },
      },
    },
  },
});
