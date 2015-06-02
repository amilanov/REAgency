# == Schema Information
#
# Table name: admins
#
#  id         :integer          not null, primary key
#  firstName  :string(255)
#  lastName   :string(255)
#  phone      :string(255)
#  email      :string(255)
#  address    :string(255)
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin < ActiveRecord::Base
  validates :firstName, :lastName, :username, :password, presence: true
  validates :username, uniqueness: true
end
