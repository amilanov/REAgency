class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :contractType

      t.timestamps
    end
  end
end
