class Role < ActiveRecord::Base
  attr_accessible :roleName

  validates :roleName, uniqueness: true

  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  def self.get_role(role_name)
    find_by_roleName(role_name)
  end
end
