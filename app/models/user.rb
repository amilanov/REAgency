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
  attr_accessible :name, :email, :username, :password, :password_confirmation, :firstName, :lastName, :address, :avatar, :role_ids
  has_secure_password

  belongs_to :city
  has_and_belongs_to_many :roles
  has_many :activities
  has_many :real_estates

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :firstName, :lastName, :username, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_attached_file :avatar, styles: { medium: '200x200>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\Z}

  def admin?
    is_admin = false

    roles.each do |role|
      is_admin = true if role[:roleName].eql?('admin')
    end

    is_admin
  end

  def assign_role(role_name)
    role = Role.get_role(role_name)
    user_roles.create!(role: role)
  end

  def can_create_real_estate?
    roles.each do |role|
      role_name = role.roleName
      return true if role_name.eql?('admin') || role_name.eql?('user') || role_name.eql?('manager') || role_name.eql?('main manager')
    end
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
