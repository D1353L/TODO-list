class ProjectsController < ApplicationController

  def index
  end

  def create
    project = Project.create(:name => params[:project_name][:value])

    unless project.valid?
      flash[:error] = project.errors.full_messages.join('<br>').html_safe
    end

    respond_to do |format|
      format.js {render 'projects/refresh_list'}
    end
  end

  def update
    project = Project.update(Project.find_by_id(params[:id]), name: params[:new_value])

    unless project.valid?
      flash[:error] = project.errors.full_messages.join('<br>').html_safe
    end

    render nothing: true
  end

  def delete
    Project.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.js {render 'projects/refresh_list'}
    end
  end
end
