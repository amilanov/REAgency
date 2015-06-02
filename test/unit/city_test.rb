# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  cityName   :string(255)
#  postalCode :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer
#

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
