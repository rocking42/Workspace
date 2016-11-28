class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :group_project
end
