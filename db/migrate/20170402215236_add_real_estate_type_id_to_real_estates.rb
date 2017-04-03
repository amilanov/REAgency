class AddRealEstateTypeIdToRealEstates < ActiveRecord::Migration
  def change
    add_column :real_estates, :real_estate_type_id, :integer
  end
end
