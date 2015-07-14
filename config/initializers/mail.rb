ActionMailer::Base.smtp_settings = {
  
  address: "smtp.mandrillapp.com",
  port: 587,
  enable_starttls_auto: true,
  user_name: Rails.application.secrets.mandrill_user_name,
  password: Rails.application.secrets.mandrill_api_key,
  authentication: 'login'

}


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"