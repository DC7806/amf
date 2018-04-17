class ApplicationMailer < ActionMailer::Base
  admin_email = YAML::load_file("#{Rails.root}/yamls/system.yml").fetch('others').fetch('email')
  default from: admin_email
  layout 'mailer'
end
