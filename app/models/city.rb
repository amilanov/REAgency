class City < ActiveRecord::Base
  belongs_to :country
  has_many :real_estates
  has_many :users

  validates :cityName, :postalCode, presence: true
  validates :cityName, uniqueness: true
end
