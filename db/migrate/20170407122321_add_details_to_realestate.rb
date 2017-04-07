class AddDetailsToRealestate < ActiveRecord::Migration
  def change
    add_column :real_estate_details, :num_of_rooms, :string
    add_column :real_estate_details, :num_of_balconies, :string
    add_column :real_estate_details, :num_of_bathrooms, :string
    add_column :real_estate_details, :floor, :string
    add_column :real_estate_details, :heating_system, :string
    add_column :real_estate_details, :orientation, :string
    add_column :real_estate_details, :windows, :string
    add_column :real_estate_details, :year_of_manufacture, :string
    add_column :real_estate_details, :aircondition, :string
    add_column :real_estate_details, :elevator, :string
    add_column :real_estate_details, :pantry, :string
  end
end
