class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.text :task
      t.date :end_date
      t.boolean :completed, default: true
      t.integer :group_project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
