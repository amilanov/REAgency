class User < ActiveRecord::Base
  belongs_to :city
  belongs_to :user_role
  has_many :activities

  validates :firstName, :lastName, :username, :password, presence: true
  validates :username, uniqueness: true
end
