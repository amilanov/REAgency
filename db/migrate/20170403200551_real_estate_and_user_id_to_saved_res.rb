class RealEstateAndUserIdToSavedRes < ActiveRecord::Migration
  def up
    add_column :saved_real_estates, :user_id, :integer
    add_column :saved_real_estates, :real_estate_id, :integer
  end

  def down
  end
end
