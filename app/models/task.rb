class Task < ActiveRecord::Base
  belongs_to :project
  default_scope {order('priority ASC')}
end
