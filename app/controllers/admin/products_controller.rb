class Admin::ProductsController < Admin::BaseController
  
  def index
    @products = category.products.all(:order => 'name')
  end
  
  def new
    @products = [Product.new]
    @category = category
  end
  
  def create
    @products = params[:products].values.collect { |product| category.products.new(product) }
    if @products.all?(&:valid?)
      @products.each(&:save!)
      redirect_to(admin_category_products_path(category), :notice => "Produkterna skapades.")
    else
      @products.each(&:valid?)
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
  
  def edit_multiple
    @products = category.products.find(params[:product_ids])
  end
  
  def update_multiple
    @products = category.products.update(params[:products].keys, params[:products].values).reject { |p| p.errors.empty?  }
    if @products.empty?
      redirect_to(admin_category_products_path(category), :notice => "Produkterna uppdaterades.")
    else
      render 'edit_multiple'
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
    
    @products.each do |product|
      product.destroy
    end
    redirect_to(admin_category_products_path(category), :notice => "Produkterna togs bort.")
  end
  
  private
  
  def category
    @category ||= Category.find(params[:category_id])
  end
  
end
