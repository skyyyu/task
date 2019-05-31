if Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        address: 'seki.yyy22@gmail.com',
        domain: 'gmail.com',
        port: 587,
        user_name: 'seki.yyy22@gmail.com',
        password: 'seki8623',
        authentication: 'plain',
        enable_starttls_auto: true
    }
elsif Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener
else
  ActionMailer::Base.delivery_method = :test
end