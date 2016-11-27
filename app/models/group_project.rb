class GroupProject < ActiveRecord::Base
  belongs_to :group
  belongs_to :organisation
  has_and_belongs_to_many :users
end
