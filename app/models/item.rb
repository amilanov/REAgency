# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  itemType   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  validates :itemType, presence: true
end
