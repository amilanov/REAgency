class UserRole < ActiveRecord::Base
  validates :roleName, presence: true
  validates :roleName, uniqueness: true
end