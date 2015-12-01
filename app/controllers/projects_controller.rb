class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @project = Project.new
  end

  def create
    @projects = Project.all
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
    @projects = Project.all
    project = Project.find_by_id(params[:id])
    project.delete
    respond_to do |format|
      format.html
      format.js {render 'projects/refresh_list'}
    end
  end
end
