class ProjectsController < ApplicationController

  def index
  end

  def create
    project = Project.create(:name => params[:project][:name])

    unless project.valid?
      flash[:error] = project.errors.full_messages.join('<br>').html_safe
    end

    respond_to do |format|
      format.html
      format.js {render 'projects/refresh_list'}
    end
  end

  def update
  end

  def delete
    project = Project.find_by_id(params[:id])
    tasks = Task.where(:project_id => params[:id])

    unless tasks.nil? || tasks.empty?
      tasks.each do |task|
        task.delete
      end
    end
    project.delete

    respond_to do |format|
      format.html
      format.js {render 'projects/refresh_list'}
    end
  end
end
