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
  attr_accessible :user_id
  attr_accessible :role_id

  belongs_to :user
  belongs_to :role
end
