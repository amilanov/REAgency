class DeleteDocuments < ActiveRecord::Migration
  def up
    drop_table :documents
  end

  def down
  end
end
