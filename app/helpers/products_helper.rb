module ProductsHelper
  
  def array_to_strings(measures)
    measure = measures.split(",")
    
    measure.each do |string|
      content_tag(:td, string)
    end
  end
  
end
