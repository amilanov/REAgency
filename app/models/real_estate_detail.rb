class RealEstateDetail < ActiveRecord::Base
  validates :real_estate_id, presence: true
end
