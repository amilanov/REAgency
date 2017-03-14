class RemoveRoleNameFromRoleNames < ActiveRecord::Migration
  def up
    remove_column :user_roles, :roleName
  end

  def down
  end
end
