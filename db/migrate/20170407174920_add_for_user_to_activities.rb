class AddForUserToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :for_user_id, :integer
  end
end
