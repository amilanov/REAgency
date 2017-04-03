class Role < ActiveRecord::Base
  attr_accessible :roleName

  validates :roleName, uniqueness: true
  has_and_belongs_to_many :users

  def self.get_role(role_name)
    find_by_roleName(role_name)
  end
end
