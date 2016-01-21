class Task < ActiveRecord::Base
  belongs_to :project
  default_scope {order('priority ASC')}

  def self.create_new_task(name, project_id)
    task = Task.create(name: name, project_id: project_id)
    task.update_attribute(:priority, task.id)
    task
  end
end
