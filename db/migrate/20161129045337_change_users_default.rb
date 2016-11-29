class ChangeUsersDefault < ActiveRecord::Migration
  def up
    change_column :user_tasks, :completed, :boolean, :default => false
  end
  def down
    change_column :user_tasks, :completed, :boolean, :default => true
  end
end
