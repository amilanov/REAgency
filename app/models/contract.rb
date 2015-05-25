class Contract < ActiveRecord::Base
  validates :contractType, presence: true
end
