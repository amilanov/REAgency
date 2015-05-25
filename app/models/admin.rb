class Admin < ActiveRecord::Base
  validates :firstName, :lastName, :username, :password, presence: true
  validates :username, uniqueness: true
end
