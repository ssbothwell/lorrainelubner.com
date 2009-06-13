module CvcatsHelper
  def add_entry_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :vitaes, :partial => 'form', :object => Vitae.new
    end
  end
end