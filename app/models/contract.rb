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
  attr_accessible :contractType

  has_many  :documents, :dependent => :destroy
  validates :contractType, presence: true
end
