class CategoriesController < ApplicationController
  
  add_breadcrumb 'Produkter', 'categories_path'
 
 def index
   @children = Category.roots
 end
 
 def show
   @category = Category.find(params[:id])
   @children = @category.children
   
   set_breadcrumb_for @category
 end
 
private
  def set_breadcrumb_for cat
    set_breadcrumb_for cat.parent if cat.parent
    add_breadcrumb cat.name, "category_path(#{cat.id})"
  end
end
