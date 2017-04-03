# == Schema Information
#
# Table name: real_estates
#
#  id             :integer          not null, primary key
#  realEstateType :string(255)
#

class RealEstateType < ActiveRecord::Base
  attr_accessible :realEstateType

  has_many :real_estates
end
