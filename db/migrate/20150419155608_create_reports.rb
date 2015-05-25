class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report
      t.datetime :reportDate

      t.timestamps
    end
  end
end
