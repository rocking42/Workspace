class CreateGroupProjectsUsers < ActiveRecord::Migration
  def change
    create_table :group_projects_users, id: false do |t|
      t.integer :group_project_id
      t.integer :user_id
    end
  end
end
