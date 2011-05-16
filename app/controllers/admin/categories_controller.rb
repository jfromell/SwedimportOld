class Admin::CategoriesController < Admin::BaseController
  
  before_filter :authenticate_admin!
  
  def index
    @categories = Category.scoped
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category   = Category.new(:parent_id => params[:category_id])
    @categories = Category.order(:names_depth_cache).map{ |c| ["-" * c.depth + c.name, c.id] }
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      redirect_to(admin_categories_url, :notice => "Kategorin skapades.")
    else
      render 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
    @categories = Category.order(:names_depth_cache).map{ |c| ["-" * c.depth + c.name, c.id] }
  end
  
  def update
    @category = Category.find(params[:id])
    update_was_successful = @category.update_attributes(params[:category])
    
    if update_was_successful
      redirect_to(admin_categories_path, :notice => "Kategorin uppdaterades.")
    else
      render 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to(admin_categories_path, :notice => "Kategorin togs bort.")
  end
  
  def destroy_multiple
    @categories = Category.find(params[:category_ids])
    
    @categories.each do |category|
      category.destroy
    end
    redirect_to(admin_categories_path, :notice => "Kategorierna togs bort.")
  end
  
end
