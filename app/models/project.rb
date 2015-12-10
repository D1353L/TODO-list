class Project < ActiveRecord::Base
  has_many :tasks, dependent: :delete_all
  validates :name, presence: true
end
