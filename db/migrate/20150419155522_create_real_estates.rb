class CreateRealEstates < ActiveRecord::Migration
  def change
    create_table :real_estates do |t|
      t.string :realEstateType
      t.string :address
      t.string :realEstateName
      t.string :description

      t.timestamps
    end
  end
end
