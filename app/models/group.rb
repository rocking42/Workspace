class Group < ActiveRecord::Base
  belongs_to :organisation
  has_many :group_posts
  has_many :group_projects
  has_and_belongs_to_many :users
end
