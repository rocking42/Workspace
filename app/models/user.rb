class User < ActiveRecord::Base
  has_secure_password
  has_many :organisation_posts
  has_and_belongs_to_many :organisations
  has_and_belongs_to_many :groups
end
