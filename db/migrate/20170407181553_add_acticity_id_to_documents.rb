class AddActicityIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :activity_id, :integer
  end
end
