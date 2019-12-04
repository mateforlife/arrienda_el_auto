ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :domain               => "herokuapp.com",
  :user_name            => "apikey",
  :password             => ENV['SENDGRID_API_KEY'],
  :authentication       => "plain",
  :enable_starttls_auto => true
 }
