module CvcatsHelper
  def add_entry_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :cventries, :partial => 'form', :object => Cventry.new
    end
  end
end