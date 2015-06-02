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

class Task < ActiveRecord::Base
  validates :taskText, presence: true
end
