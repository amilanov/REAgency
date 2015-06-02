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

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
