class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskText
      t.datetime :taskDate
      t.string :taskDuration

      t.timestamps
    end
  end
end
