class Painting < ActiveRecord::Base
  has_attached_file :photo, :styles => { :small => "150x98>", :medium => "550x450>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 12.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  def self.search(search, page)
    paginate :per_page => 16, :page => page,
             :order => 'created_at ASC'
  end

end
