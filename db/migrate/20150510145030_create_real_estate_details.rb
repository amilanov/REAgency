class CreateRealEstateDetails < ActiveRecord::Migration
  def change
    create_table :real_estate_details do |t|
      t.string :size
      t.string :images
      t.string :realEstateType
      t.string :condition
      t.string :note
      t.integer :real_estate_id

      t.timestamps
    end
  end
end
