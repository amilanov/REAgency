class AddColumnsToRealEstateDetails < ActiveRecord::Migration
  def change
    add_column :real_estate_details, :address, :string
    add_column :real_estate_details, :description, :string
  end
end
