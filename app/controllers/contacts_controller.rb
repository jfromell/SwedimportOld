class ContactsController < ApplicationController
   
  def create
    @contact_message = Contact.new(params[:contact_message])
    @contact_message.save
    flash[:notice] = 'Ditt meddelande har skickats!'
  end
  
end
