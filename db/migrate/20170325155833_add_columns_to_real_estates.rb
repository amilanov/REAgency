class AddColumnsToRealEstates < ActiveRecord::Migration
  def change
    add_column :real_estates, :realEstateType, :string
    add_column :real_estates, :address, :string
    add_column :real_estates, :description, :string
  end
end