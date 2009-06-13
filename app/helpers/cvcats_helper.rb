module CvcatsHelper
  def add_task_link(form_builder)
    link_to_function 'add an entry' do |page|
      form_builder.fields_for :cventries, Cventry.new do |f|
        page.insert_html :bottom, :entries, :partial => 'entries', :locals => { :entry_form => f }
      end
    end
  end
end