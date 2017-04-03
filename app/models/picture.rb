class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :real_estate

  has_attached_file :image, styles: { large: '800x800>', medium: '200x200>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\Z}
end
