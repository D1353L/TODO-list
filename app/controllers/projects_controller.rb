class ProjectsController < ApplicationController

  def index
  end

  def create
    project = Project.create(:name => params[:project_name][:value], :user_id => current_user.id)

    unless project.valid?
      flash[:error] = project.errors.full_messages.join('<br>').html_safe
    end

    respond_to do |format|
      format.js {render 'projects/add_project', :locals => {:project=>project}}
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
      format.js {render 'projects/delete_project', :locals => {:id=>params[:id]}}
    end
  end
end
