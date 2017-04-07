class AddRealEstateIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :real_estate_id, :integer
  end
end
