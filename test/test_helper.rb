ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:user)
  end
  
  def create_project
	name = Faker::Lorem.sentence(3)
	old_controller = @controller
	@controller = ProjectsController.new
	
	post :create, project_name: { value: name }, format: :js
	
	@controller = old_controller
	{:id => Project.last.id,
	 :name => name}
  end
  
  def create_task(project_id)
    name = Faker::Lorem.sentence(3)
	
	post :create, params = {task_name: name, project_id: project_id, format: :js}
	
	{:id => Task.last.id,
	 :name => name}
  end
end
