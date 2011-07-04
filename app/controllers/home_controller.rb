class HomeController < ApplicationController
  
  def index
    @featured = Category.all.sample(n=3)
    @news = News.all(:order => 'created_at desc', :limit => 5)
  end
  
  def about
    add_breadcrumb 'Om Swedimport', about_path
  end
  
  def search
    options = {
      :star => true, :field_weights => { :name => 20, :associated => 10, :description => 5 }
    }
    query = params[:search]
    @products = Category.search(query, options)
    
    add_breadcrumb "Sökresultat för #{query}", search_path
  end
  
end