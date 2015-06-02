# == Schema Information
#
# Table name: offices
#
#  id         :integer          not null, primary key
#  officeName :string(255)
#  address    :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Office < ActiveRecord::Base
  validates :officeName, :address, presence: true
end
