class AddFinishedToRealEstate < ActiveRecord::Migration
  def change
    add_column :real_estates, :finished, :boolean
  end
end
