class HomeController < ApplicationController
  
  def index
    
  end
  
  def about
    add_breadcrumb 'Om Swedimport', about_path
  end
  
end