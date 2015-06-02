# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  roleName   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserRole < ActiveRecord::Base
  has_many :users

  validates :roleName, presence: true
  validates :roleName, uniqueness: true
end
