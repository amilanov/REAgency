class Office < ActiveRecord::Base
  validates :officeName, :address, presence: true
end
