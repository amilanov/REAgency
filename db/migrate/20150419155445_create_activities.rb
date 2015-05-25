class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activityName
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps
    end
  end
end
