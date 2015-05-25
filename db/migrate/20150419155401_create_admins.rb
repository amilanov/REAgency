class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :firstName
      t.string :lastName
      t.string :phone
      t.string :email
      t.string :address
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
