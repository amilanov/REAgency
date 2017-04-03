class AddCityIdAndUserIdToRealEstates < ActiveRecord::Migration
  def change
    add_column :real_estates, :city_id, :integer
    add_column :real_estates, :user_id, :integer
    add_index  :real_estates, :city_id
    add_index  :real_estates, :user_id
  end
end
