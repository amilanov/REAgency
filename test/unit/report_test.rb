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

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
