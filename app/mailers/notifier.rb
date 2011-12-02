class Notifier < ActionMailer::Base
  
  def contact_us(contact_message)
    @contact_message = contact_message
    
    mail(:to => info@swedimport.se, :from => contact_message.email, :subject => contact_message.subject)
  end
  
end
