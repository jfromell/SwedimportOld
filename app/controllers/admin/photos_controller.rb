class Admin::PhotosController < Admin::BaseController
  before_filter :authenticate_admin!
  before_filter :find_category
  before_filter :find_or_build_photo
  
  def create
    respond_to do |format|
      unless @photo.save
        flash[:error] = 'Bilden kunde inte sparas.'
      end
      format.js do
        render :text => render_to_string(:partial => 'admin/photos/photo', :locals => { :photo => @photo })
      end
    end
  end
  
  def destroy
    respond_to do |format|
      unless @photo.destroy
        flash[:error] = 'Bilden kunde inte tas bort.'
      end
      format.js
    end
  end
  
  private
    def find_category
      @category = Category.find(params[:category_id])
    end
    
    def find_or_build_photo
      @photo = params[:id] ? @category.photos.find(params[:id]) : @category.photos.build(params[:photo])
    end
end