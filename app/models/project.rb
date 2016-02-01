class Project < ActiveRecord::Base
  has_many :tasks, dependent: :delete_all
  validates :name, presence: true, length: { maximum: 255 }
  default_scope {order('id ASC')}
end
