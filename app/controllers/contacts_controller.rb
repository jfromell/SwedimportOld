class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new(:id => 1)
    add_breadcrumb 'Kontakta oss', contact_path
    
    @map = GMap.new('map')
    
    @map.control_init(:large_map => false, :map_type => false)
    @map.center_zoom_init([59.602728,15.190063],14)
    @map.overlay_init(GMarker.new([59.602728,15.190063], :title => "Swedimport AB", :info_window => "Info! Info!"))
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to(root_path, :notice => "Din fråga skickades, vi svarar så snart vi kan.")
    else
      flash[:alert] = "Du måste fylla i alla fält."
      render 'new'
    end
  end
  
end
