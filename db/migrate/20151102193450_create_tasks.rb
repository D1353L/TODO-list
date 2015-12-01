class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.string :name
      t.string :status
      t.integer :project_id

      t.timestamps
    end
    add_foreign_key :tasks, :projects
  end
end
