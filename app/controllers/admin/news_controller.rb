# encoding: utf-8

class Admin::NewsController < Admin::BaseController
  
  def index
    @news = News.all
  end
  
  def new
    @news = News.new
  end
  
  def create
    @news = News.new(params[:news])
    
    if @news.save
      redirect_to(admin_news_index_path, :notice => "Nyheten har skapats")
    else
      render 'new'
    end
  end
  
  def edit
    @news = News.find(params[:id])
  end
  
  def update
    @news = News.find(params[:id])
    update_was_successful = @news.update_attributes(params[:news])
    
    if update_was_successful
      redirect_to(admin_news_index_path, :notice => "Nyheten ändrades")
    else
      render 'edit'
    end
  end
  
end