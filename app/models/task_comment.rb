class TaskComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_task
end
