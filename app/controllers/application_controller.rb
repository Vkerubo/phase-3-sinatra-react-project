require 'sinatra'
require 'json'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  # Projects routes
  get '/projects' do
    projects = Project.all
    projects.to_json(include: :tasks)
  end

  post '/projects' do
    project = Project.create_new_project_with_defaults(data)

    if project.save
      project.to_json(include: :tasks)
    else
      {error:'Project not created'}.to_json
    end
  end

  patch '/projects/:id' do
    project = Project.find(params[:id])

    if project.update(data)
      project.to_json
    else
      {error: 'Failed to update project.'}.to_json
      end
  end

  delete '/projects/:id' do
    project = Project.find(params[:id])

    if project && project.destroy
      {message: 'Project successfully deleted', project: project}.to_json
    else
      { error: 'Failed to delete project'}.to_json
    end
  end


  # GET /projects - get all project
  # PUT /projects - create new project
  # PATCH /project/:id - update project name
  # DELETE /project/:id - delete project (maybe also delete all boards and tasks associated)

  # Tasks routes
  get '/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  get '/tasks/:id' do
    task = Task.find(params[:id])
    task.to_json
  end

  post '/tasks' do
    task = Task.create_new_task_with_defaults(data)
    if task.save
      task.to_json
    else
      { error: 'Failed to create task' }.to_json
    end
  end

  patch '/tasks/:id' do
    task = Task.find(params[:id])

    if task.update(data)
      task.to_json
    else
      { error: 'Failed to update task' }.to_json
    end
  end

  delete '/tasks/:id' do
    task = Task.find(params[:id])

    if task && task.destroy
      { message: 'Task successfully deleted', task: task }.to_json
    else
      { error: 'Failed to delete task' }.to_json
    end
  end

  # GET /tasks - get all tasks associated with board
  # PUT /tasks - create new task within board
  # PATCH /tasks/:id - update task
  # DELETE /tasks/:id - delete task


  # Boards routes
  get '/boards' do
    boards = Board.all
    boards.to_json
  end

  get '/boards/:id' do
    board = Board.find(params[:id])
    board.to_json
  end

  post '/boards' do
    board = Board.create(data)
    if board.save
      board.to_json
    else
      { error: 'Failed to create board' }.to_json
    end
  end

  patch '/boards/:id' do
    board = Board.find(params[:id])

    if board.update(data)
      board.to_json
    else
      { error: 'Failed to update board' }.to_json
    end
  end

  delete '/boards/:id' do
    board = Board.find(params[:id])

    if board && board.destroy
      { message: 'Board successfully deleted', board: board }.to_json
    else
      { error: 'Failed to delete board' }.to_json
    end
  end

  # GET /boards - get all boards associated to project
  # PUT /boards - create new board within project
  # PATCH /boards/:id - update board name
  # DELETE /boards/:id - delete board (maybe also delete all tasks associated)

  not_found do
    'Path Not Found'
  end
end
