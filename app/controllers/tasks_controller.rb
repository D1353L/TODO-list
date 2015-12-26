class TasksController < ApplicationController

  def add
    task = Task.create(name: params[:task][:name], project_id: params[:project_id])

    unless task.valid?
      flash[:error] = task.errors.full_messages.join('<br>').html_safe
    end

    respond_to do |format|
      format.js {render 'projects/refresh_list'}
    end
  end

  def update
  end

  def change_status
    t = Task.find_by_id(params[:id])
    t.update_attribute(:completed, !t.completed)

    render nothing: true
  end

  def sort
    params[:order].each do |key,value|
      Task.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render nothing: true
  end

  def delete
    Task.find_by_id(params[:id]).destroy
	
    respond_to do |format|
      format.js {render 'projects/refresh_list'}
    end
  end
end
