class TaskComment < ActiveRecord::Base
  acts_as_readable :on => :created_at
  belongs_to :user
  belongs_to :user_task
end
