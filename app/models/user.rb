# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  firstName  :string(255)
#  lastName   :string(255)
#  address    :string(255)
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :username, :password, :password_confirmation, :firstName, :lastName, :address
  has_secure_password

  belongs_to :city
  belongs_to :user_role
  has_many :activities

  before_save { |user| user.email = email.downcase }

  validates :firstName, :lastName, :username, :password, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
