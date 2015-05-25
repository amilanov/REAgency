class Task < ActiveRecord::Base
  validates :taskText, presence: true
end
