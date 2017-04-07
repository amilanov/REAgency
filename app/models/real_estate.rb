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

class RealEstate < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  belongs_to :real_estate_type
  has_one    :real_estate_detail
  accepts_nested_attributes_for :real_estate_detail, allow_destroy: true
  has_many   :pictures, :dependent => :destroy
  has_many   :contract

  validates :realEstateName, presence: true
  validates :city_id, presence: true
  validates :user_id, presence: true
  validates :real_estate_type_id, presence: true
end
