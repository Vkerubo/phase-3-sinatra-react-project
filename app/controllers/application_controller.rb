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

  # Similar implementation for boards and tasks routes

  not_found do
    'Path Not Found'
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
    task = Task.create(data)
    if task.save
      task.to_json
    else
      { error: 'Failed to create task' }.to_json
    end
  end
