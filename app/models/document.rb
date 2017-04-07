class Document < ActiveRecord::Base
  attr_accessible :file, :contract_id
  belongs_to :contract

  has_attached_file :file
  # validates_attachment_content_type :file, content_type: { content_type: "application/pdf" }
  # validates_attachment :file, content_type: { content_type: "application/pdf" }
end
