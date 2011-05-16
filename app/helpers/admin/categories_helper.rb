module Admin::CategoriesHelper
  
  def nested_categories(categories)
    categories.map do |category, subcategories|
      render(category) + (nested_categories(subcategories))
    end.join.html_safe
  end
  
  def add_photo(form_builder)
    link_to_function "add", :id => "add_photo" do |page|
      form_builder.fields_for :photos, Photo.new, :child_index => 'NEW_RECORD' do |photo_form|
        html = render(:partial => 'photo', :locals => { :f => photo_form })
        page << "$('#add_photo').before('#{escape_javascript(html)}');"
      end
    end
  end
  
  def delete_photo(form_builder)
    if form_builder.object.new_record?
      link_to_function("Remove this photo", "$(this).parent().remove()")
    else
      form_builder.hidden_field(:_delete) +
      link_to_function("Remove this photo", "$(this).parent().hide(); $(this).prev().val('1')")
    end
  end
  
end
