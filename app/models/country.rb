# == Schema Information
#
# Table name: countries
#
#  id          :integer          not null, primary key
#  countryName :string(255)
#  postalCode  :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Country < ActiveRecord::Base
  attr_accessible :countryName, :postalCode

  has_many :cities, dependent: :destroy
  validates :countryName, :postalCode, presence: true
  validates :countryName, uniqueness: true
end
