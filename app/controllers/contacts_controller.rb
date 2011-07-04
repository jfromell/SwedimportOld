class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new(:id => 1)
    add_breadcrumb 'Kontakta oss', contact_path
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
