# Project Task Management API

This project management API is a web API where you make CRUD calls to a server to organize a project management app.

## Front-end Work Flow Planner

You can use this API in conjunction with my front-end Work Flow Planner app [see the repo](https://github.com/Vkerubo/work-flow-planner-frontend)

## Technologies Used in API

- Ruby
- ActiveRecord
- SQLite3
- Sinatra

## How To Use

Install it and run:

```sh
bundle install

# create migrations with activerecord
rake db:migrate

# if you would like to use seed data
rake db:seed

# start server
rake server
```

rake server uses port 9292 by default.

## Relationships within Database

### Projects

- has many boards
- has many tasks through boards

### Boards

- belongs to a project
- has many tasks

### Tasks

- belongs to a board
- belongs to project though a board

## Example Calls You Can Make With API

### Projects

You can make all CRUD calls for the projects database.

- CREATE projects
- GET/RETRIEVE all projects
- GET/RETRIEVE individual project
- DELETE a project
- UPDATE a project

### Boards

You can make all CRUD calls for the projects database.

- CREATE boards
- GET/RETRIEVE all boards
- DELETE a board
- UPDATE a board

### Tasks

You can make all CRUD calls for the projects database.

- CREATE tasks
- GET/RETRIEVE all tasks
- DELETE a task
- UPDATE a task

##Author
Vkerubo
