class Report < ActiveRecord::Base
  validates :report, presence: true
end
