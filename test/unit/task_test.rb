# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  taskText     :string(255)
#  taskDate     :datetime
#  taskDuration :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
