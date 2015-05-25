class RealEstate < ActiveRecord::Base
  belongs_to :city
  validates :realEstateName, presence: true
end
