class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :itemType

      t.timestamps
    end
  end
end
