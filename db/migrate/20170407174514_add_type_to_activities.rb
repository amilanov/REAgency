class AddTypeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :activityType, :string
    add_column :activities, :user_id, :integer
  end
end
