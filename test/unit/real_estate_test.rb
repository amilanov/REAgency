# == Schema Information
#
# Table name: real_estates
#
#  id             :integer          not null, primary key
#  realEstateType :string(255)
#  address        :string(255)
#  realEstateName :string(255)
#  description    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class RealEstateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
