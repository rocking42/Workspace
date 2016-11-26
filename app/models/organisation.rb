class Organisation < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :groups
  has_many :organisation_posts
end
