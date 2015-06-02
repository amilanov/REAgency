# == Schema Information
#
# Table name: real_estates
#
#  id             :integer          not null, primary key
#  realEstateType :string(255)
#  address        :string(255)
#  realEstateName :string(255)
#  description    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class RealEstate < ActiveRecord::Base
  belongs_to :city
  validates :realEstateName, presence: true
end
