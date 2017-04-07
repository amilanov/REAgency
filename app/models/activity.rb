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
  attr_accessible :activityName, :activityType, :for_user_id, :startDate, :endDate

  belongs_to :user
  has_many   :documents, :dependent => :destroy

  validates :activityName, :startDate, presence: true
end
