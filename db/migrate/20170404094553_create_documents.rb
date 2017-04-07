class CreateDocuments < ActiveRecord::Migration
  def up
    create_table :documents do |t|
      t.integer  :contract_id
      t.string   :file_file_name
      t.string   :file_content_type
      t.integer  :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end
  end

  def down
  end
end
