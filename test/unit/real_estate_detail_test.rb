# == Schema Information
#
# Table name: real_estate_details
#
#  id             :integer          not null, primary key
#  size           :string(255)
#  images         :string(255)
#  realEstateType :string(255)
#  condition      :string(255)
#  note           :string(255)
#  real_estate_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class RealEstateDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
