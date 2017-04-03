class AddRealEstateIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :real_estate_id, :integer
    add_index  :pictures, :real_estate_id
  end
end
