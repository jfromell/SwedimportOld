class Admin::ProductsController < Admin::BaseController
  
  def index
    t@products = category.products.all
  end
  
  def new
    @product = category.products.new(params[:category_id])
  end
  
  def create
    @product = category.products.new(params[:product])
    if @product.save
      redirect_to(admin_category_products_path(category), :notice => "Produkten skapades.")
    else
      render 'new'
    end
  end
  
  def edit
    @product = category.products.find(params[:id])
  end
  
  def update
    @product = category.products.find(params[:id])
    update_was_successful = @product.update_attributes(params[:product])
    
    if update_was_successful
      redirect_to(admin_category_products_path(category), :notice => "Produkten uppdaterades.")
    else
      render 'edit'
    end
  end
  
  def destroy
    @product = category.products.find(params[:id])
    
    if @product.destroy
      redirect_to(admin_category_products_path(category), :notice => "Produkten togs bort.")
    else
      redirect_to(admin_category_products_path(category), :notice => "Produkten kunde inte tas bort. Försök igen.")
    end
  end
  
  def destroy_multiple
    @products = category.products.find(params[:product_ids])
    
    @product.each do |product|
      product.destroy
    end
    redirect_to(admin_category_products_path(category), :notice => "Produkterna togs bort.")
  end
  
  private
  
  def category
    @category ||= Category.find(params[:category_id])
  end
  
end
