class RemoveTableAdmin < ActiveRecord::Migration
  def up
  end

  def down
    drop_table :admins
    drop_table :employees
    drop_table :managers
  end
end
