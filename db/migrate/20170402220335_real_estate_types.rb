class RealEstateTypes < ActiveRecord::Migration
  def up
    drop_table :real_estate_type
    create_table :real_estate_types do |t|
      t.string :realEstateType
      t.timestamps
    end
  end

  def down
  end
end
