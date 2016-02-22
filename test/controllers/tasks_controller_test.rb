require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should create task" do
    project_id = create_project[:id]
	name = create_task(project_id)[:name]
	
    assert_response :success
	assert flash.empty?
	assert_not_nil Task.find_by(name: name)
  end

  test "should update task" do
	project_id = create_project[:id]
	taskHsh = create_task(project_id)
	name = taskHsh[:name]
	id = taskHsh[:id]
	
	new_name = Faker::Lorem.sentence(3)
    put :update, { id: id, new_value: new_name }
	
    assert_response :success
	assert flash.empty?
	assert_not_nil Task.find_by(name: new_name)
	assert_nil Task.find_by(name: name)
  end

  test "should delete task" do
    project_id = create_project[:id]
	id = create_task(project_id)[:id]
	
    delete :delete, id: id, format: :js
    
	assert_response :success
	assert flash.empty?
	assert_nil Task.find_by(id: id)
  end
  
  test "should change task status" do
    project_id = create_project[:id]
	id = create_task(project_id)[:id]
    old_status = Task.find_by(id: id).completed
	
	put :change_status, id: id
    
	assert_response :success
	assert flash.empty?
	assert_not_equal Task.find_by(id: id).completed, old_status
  end
  
  test "should sort tasks" do
	tasks = Array.new
	updated_order = Hash.new
	project_id = create_project[:id]
	old_order = Task.pluck(:priority)
	
	10.times do
	  tasks << create_task(project_id)[:id]
	end
	
	tasks.shuffle
	
	for i in 0..tasks.size-1
	  updated_order[i] = {id: tasks[i], position: i+1}
	end
	
	put :sort, order: updated_order
	new_order = Task.pluck(:priority)
	
	assert_response :success
	assert flash.empty?
	assert_not_equal old_order, new_order
  end
end
