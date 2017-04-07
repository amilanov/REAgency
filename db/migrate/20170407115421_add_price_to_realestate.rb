class AddPriceToRealestate < ActiveRecord::Migration
  def change
    add_column :real_estate_details, :price, :string
  end
end
