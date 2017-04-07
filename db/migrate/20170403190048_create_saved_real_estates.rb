class CreateSavedRealEstates < ActiveRecord::Migration
  def change
    create_table :saved_real_estates do |t|

      t.timestamps
    end
  end
end
