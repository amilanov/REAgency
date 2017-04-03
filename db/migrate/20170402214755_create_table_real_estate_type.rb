class CreateTableRealEstateType < ActiveRecord::Migration
  def up
    create_table :real_estate_type do |t|
      t.string :realEstateType
      t.timestamps
    end
  end

  def down
  end
end
