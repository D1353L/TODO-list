class TasksController < ApplicationController

  def add
    task = Task.create(:name => params[:task][:name], :project_id => params[:project_id])

    unless task.valid?
      flash[:error] = task.errors.full_messages.join('<br>').html_safe
    end

    respond_to do |format|
      format.html
      format.js {render 'projects/refresh_list'}
    end
  end

  def update
  end

  def delete
    task = Task.find_by_id(params[:id])
    task.destroy
	
    respond_to do |format|
      format.html
      format.js {render 'projects/refresh_list'}
    end
  end
end
