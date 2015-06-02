# == Schema Information
#
# Table name: contracts
#
#  id           :integer          not null, primary key
#  contractType :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  contactStart :datetime
#  contractEnd  :datetime
#

require 'test_helper'

class ContractTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
