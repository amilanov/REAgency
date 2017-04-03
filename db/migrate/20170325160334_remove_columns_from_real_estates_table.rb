class RemoveColumnsFromRealEstatesTable < ActiveRecord::Migration
  def up
    remove_column :real_estates, :realEstateType
    remove_column :real_estates, :address
    remove_column :real_estates, :description
  end

  def down
  end
end
