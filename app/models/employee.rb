class Employee < ActiveRecord::Base
  validates :firstName, :lastName, :username, :password, :profession, presence: true
  validates :username, uniqueness: true
end
