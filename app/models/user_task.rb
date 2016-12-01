class UserTask < ActiveRecord::Base
  has_many :task_comments, dependent: :destroy
  belongs_to :user
  belongs_to :group_project
end
