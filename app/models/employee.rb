# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  firstName  :string(255)
#  lastName   :string(255)
#  address    :string(255)
#  username   :string(255)
#  password   :string(255)
#  profession :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ActiveRecord::Base
  validates :firstName, :lastName, :username, :password, :profession, presence: true
  validates :username, uniqueness: true
end
