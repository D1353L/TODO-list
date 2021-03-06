class Task < ActiveRecord::Base
  belongs_to :project
  validates :name, :project_id, presence: true, length: { maximum: 255 }
  default_scope {order('priority ASC')}

  def self.create_new_task(name, project_id)
    task = Task.create(name: name, project_id: project_id)
    if task.valid?
      task.update_attribute(:priority, task.id)
    end
    task
  end
end
