class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.string :name
      t.boolean :completed, default: false
      t.integer :project_id

      t.timestamps
    end
    add_foreign_key :tasks, :projects
  end
end
