class Country < ActiveRecord::Base
  has_many :cities
  validates :countryName, :postalCode, presence: true
  validates :countryName, uniqueness: true
end
