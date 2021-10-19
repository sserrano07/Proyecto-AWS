[
  {
    "name": "myapp",
    "image": "${app_image}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "networkMode": "awsvpc",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/myapp",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}

      }
    ],
    "environment": [
       {
        "name": "WORDPRESS_DB_HOST",
        "value": "${rds_endpoint}"
      }, 
      {
        "name": "WORDPRESS_DB_USER",
        "value": "${username}"
      },
      {
        "name": "WORDPRESS_DB_PASSWORD",
        "value": "${password}"
      },
      {
        "name": "WORDPRESS_DB_NAME",
        "value": "${db_instance_name}"
      }
    ]
  }
]