class DeleteImages < ActiveRecord::Migration
  def up
    remove_column :real_estate_details, :images
  end

  def down
  end
end
