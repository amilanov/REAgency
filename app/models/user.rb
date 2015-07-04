# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  firstName       :string(255)
#  lastName        :string(255)
#  address         :string(255)
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :username, :password, :password_confirmation, :firstName, :lastName, :address, :avatar
  has_secure_password

  belongs_to :city
  belongs_to :user_role
  has_many :activities

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :firstName, :lastName, :username, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_attached_file :avatar, styles: { medium: '200x200>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\Z}

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
