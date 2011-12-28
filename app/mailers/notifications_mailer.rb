class NotificationsMailer < ActionMailer::Base
  
  default from: "noreply@swedimport.se"
  default to: "feedtheplague@gmail.com"
  
  def new_message(message)
    @message = message
    mail(:subject => "[Swedimport.se] #{message.subject}")
  end
  
end
