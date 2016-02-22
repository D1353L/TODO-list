require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    get :index
    assert_response :success
	assert_includes @response.body, "id=\"addNewProject\""
  end

  test "should create project" do
    name = create_project[:name]
	
	assert_response :success
	assert_includes @response.body, name
	assert flash.empty?
	assert_not_nil Project.find_by(name: name)
  end

  test "should update project" do
	projectHsh = create_project
	name = projectHsh[:name]
	id = projectHsh[:id]
	
	new_name = Faker::Lorem.sentence(3)
    put :update, { id: id, new_value: new_name }
	
    assert_response :success
	assert flash.empty?
	assert_not_nil Project.find_by(name: new_name)
	assert_nil Project.find_by(name: name)
  end

  test "should delete project" do
	id = create_project[:id]
	
    delete :delete, id: id, format: :js
    
	assert_response :success
	assert flash.empty?
	assert_nil Project.find_by(id: id)
  end
end
