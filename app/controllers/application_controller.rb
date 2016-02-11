class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :init_vars, :authenticate_user!

  def init_vars
    if !current_user.nil?
      @projects = Project.where(user_id: current_user.id)
    end
    @project = Project.new
    @task = Task.new
  end
end