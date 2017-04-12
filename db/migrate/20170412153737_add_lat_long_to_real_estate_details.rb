class AddLatLongToRealEstateDetails < ActiveRecord::Migration
  def change
    add_column :real_estate_details, :latitude, :string
    add_column :real_estate_details, :longitude, :string
  end
end
