class Painting < ActiveRecord::Base
  has_attached_file :photo, :styles => { :small => "150x98>", :medium => "550x450>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 12.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  def self.search(page, year)
    conditions = {}
    if year
      start_date = year.to_i                                               
      end_date = (start_date + 9)                                           
      conditions.merge!({ :year => start_date..end_date })
    end
    paginate  :per_page => 16, :page => page,                       
              :conditions => conditions,     
              :order => 'created_at ASC'
  end

end
