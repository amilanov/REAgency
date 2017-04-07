# == Schema Information
#
# Table name: real_estate_details
#
#  id             :integer          not null, primary key
#  size           :string(255)
#  images         :string(255)
#  realEstateType :string(255)
#  condition      :string(255)
#  note           :string(255)
#  real_estate_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class RealEstateDetail < ActiveRecord::Base
  belongs_to :real_estate
  attr_accessible :size, :condition, :note, :address, :description, :price, :num_of_rooms, :num_of_balconies, :num_of_bathrooms,
                  :floor, :heating_system, :orientation, :windows, :year_of_manufacture, :aircondition, :elevator, :pantry
  validates :real_estate_id, presence: true
end