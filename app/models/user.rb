class User < ActiveRecord::Base
  has_secure_password
  has_many :organisation_posts, dependent: :destroy
  has_many :group_posts, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :task_comments, dependent: :destroy
  has_and_belongs_to_many :organisations
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :group_projects
end
