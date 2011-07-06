class Notifier < ActionMailer::Base
  
  def contact_notification(sender)
    @sender = sender
    mail(:to      => 'info@swedimport.se',
         :from    => sender.email,
         :subject => "Meddelande från #{sender.email} genom Swedimport.se"
        )
  end
end
