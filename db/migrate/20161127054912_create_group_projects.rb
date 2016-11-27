class CreateGroupProjects < ActiveRecord::Migration
  def change
    create_table :group_projects do |t|
      t.text :task
      t.boolean :completed
      t.datetime :start_date
      t.datetime :end_date
      t.integer :organisation_id
      t.integer :group_id
      t.integer :user_id
      t.integer :group_shedule_id

      t.timestamps null: false
    end
  end
end
