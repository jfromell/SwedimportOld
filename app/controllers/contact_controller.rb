# encoding: utf-8

class ContactController < ApplicationController
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(contact_path, :notice => "Meddelandet skickades!")
    else
      flash.now.alert = "Var god fyll i alla fält"
      render :new
    end
  end
  
end
