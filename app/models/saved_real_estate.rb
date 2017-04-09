class SavedRealEstate < ActiveRecord::Base
  attr_accessible :user_id, :real_estate_id

  belongs_to :user

  validates :real_estate_id, presence: true
  validates :user_id, presence: true

  def ret_real_estate
    RealEstate.where(id: real_estate_id).first
  end

  def self.saved?(current_user, re_id)
    return false unless current_user
    where(user_id: current_user.id, real_estate_id: re_id)
  end
end
