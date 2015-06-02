# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  cityName   :string(255)
#  postalCode :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer
#

class City < ActiveRecord::Base
  belongs_to :country
  has_many :real_estates
  has_many :users

  validates :cityName, :postalCode, presence: true
  validates :cityName, uniqueness: true
end
