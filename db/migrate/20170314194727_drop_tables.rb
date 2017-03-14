class DropTables < ActiveRecord::Migration
  def up
    drop_table :admins
    drop_table :employees
    drop_table :managers
  end

  def down
  end
end
