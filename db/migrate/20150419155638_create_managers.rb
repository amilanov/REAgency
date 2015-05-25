class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :firstName
      t.string :lastName
      t.string :address
      t.string :phone
      t.string :email
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
