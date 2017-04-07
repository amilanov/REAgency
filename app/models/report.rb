# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  report     :string(255)
#  reportDate :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ActiveRecord::Base
  attr_accessible :report, :created_at
  belongs_to :user
  validates :report, presence: true
end
