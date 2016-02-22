require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should not save task without name" do
    task = Task.new project_id: 1 
    assert_not task.save, "Saved the task without a name"
  end
  
  test "should not save task without project_id" do
    task = Task.new name: "name"
    assert_not task.save, "Saved the task without a project_id"
  end
end
