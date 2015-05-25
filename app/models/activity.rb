class Activity < ActiveRecord::Base
  belongs_to :user

  validates :activityName, :startDate, presence: true
end
