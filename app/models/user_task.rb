class UserTask < ActiveRecord::Base
  has_many :task_comments
  belongs_to :user
  belongs_to :group_project
end
