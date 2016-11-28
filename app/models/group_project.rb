class GroupProject < ActiveRecord::Base
  has_many :user_tasks
  belongs_to :group
  belongs_to :organisation
  has_and_belongs_to_many :users
end
