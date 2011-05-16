class Notifier < ActionMailer::Base
  
  def contact_notification(sender)
    @sender = sender
    mail(:to      => 'feedtheplague@gmail.com',
         :from    => sender.email,
         :subject => "Meddelande från Swedimport.se"
        )
  end
end
