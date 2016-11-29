class CreateTaskComments < ActiveRecord::Migration
  def change
    create_table :task_comments do |t|
      t.text :comment
      t.string :image
      t.integer :user_task_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
