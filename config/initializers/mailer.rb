ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => 'www.swedimport.se',
  :user_name => 'feedtheplague@gmail.com',
  :password => '7q1y6646',
  :authentication => 'plain'
}