# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  activityName :string(255)
#  startDate    :datetime
#  endDate      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Activity < ActiveRecord::Base
  belongs_to :user

  validates :activityName, :startDate, presence: true
end
