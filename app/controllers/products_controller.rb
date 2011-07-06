class ProductsController < ApplicationController
  
  add_breadcrumb 'Produkter', 'categories_path'
 
 def index
   @products = category.products.order("name asc")
   @category = category
   
   set_breadcrumb_for category
 end
 
 private
  def category
    @category ||= Category.find(params[:category_id])
  end
 
  def set_breadcrumb_for cat
    set_breadcrumb_for cat.parent if cat.parent
    add_breadcrumb cat.name, "category_path(#{cat.id})"
  end
 
end
