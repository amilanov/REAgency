class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstName
      t.string :lastName
      t.string :address
      t.string :username
      t.string :password
      t.string :profession

      t.timestamps
    end
  end
end
