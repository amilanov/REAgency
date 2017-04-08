class DeleteItemAndSaveItem < ActiveRecord::Migration
  def up
    drop_table :items
    # drop_table :saved_items
  end

  def down
  end
end
