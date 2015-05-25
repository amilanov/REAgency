class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :officeName
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
