class Item < ActiveRecord::Base
  validates :itemType, presence: true
end
