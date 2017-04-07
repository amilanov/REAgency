# == Schema Information
#
# Table name: contracts
#
#  id           :integer          not null, primary key
#  contractType :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  contactStart :datetime
#  contractEnd  :datetime
#

class Contract < ActiveRecord::Base
  attr_accessible :contractType, :contactStart, :contractEnd, :contractName, :real_estate_id

  has_many   :documents, :dependent => :destroy
  belongs_to :user
  belongs_to :real_estate
  validates  :contractType, presence: true
  validates  :real_estate_id, presence: true
end
