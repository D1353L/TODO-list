class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :init_vars

  def init_vars
    @projects = Project.all
    @project = Project.new
    @task = Task.new
  end
end