class Painting < ActiveRecord::Base
  has_attached_file :photo, :styles => { :small => "150x98>", :medium => "550x450>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 12.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  def self.search(page, year)
    year = year.to_i
    if year == nil
      start_date = 1900
      end_date = 3000
    else
      start_date = year
      end_date = (year + 9)
    end
    paginate  :per_page => 16, :page => page,
              :conditions => { :year => start_date..end_date },
              :order => 'created_at ASC'
  end

end
