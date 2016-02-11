class TasksController < ApplicationController

  def create
    task = Task.create_new_task(params[:task_name], params[:project_id])

    unless task.valid?
      flash[:error] = task.errors.full_messages.join('<br>').html_safe
    end

    respond_to do |format|
      format.js {render 'tasks/add_task', :locals => {:task=>task}}
    end
  end

  def update
    task = Task.update(Task.find_by_id(params[:id]), name: params[:new_value])

    unless task.valid?
      flash[:error] = task.errors.full_messages.join('<br>').html_safe
    end

    render nothing: true
  end

  def change_status
    task = Task.find_by_id(params[:id])
    task.update_attribute(:completed, !task.completed)

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
      format.js {render 'tasks/delete_task', :locals => {:id=>params[:id]}}
    end
  end
end
