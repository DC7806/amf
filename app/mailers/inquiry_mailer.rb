class InquiryMailer < ApplicationMailer
  # notify admin

  def admin_notification(inquiry)
    admin_email = YAML::load_file("#{Rails.root}/yamls/system.yml").fetch('others').fetch('email')
    @inquiry = inquiry
    mail to: admin_email, subject: '[AMFcreative] 新訊息'
  end

  # auto reply to users
  def user_notification(inquiry)
    @inquiry = inquiry
    mail to: @inquiry.email, subject: '[來自AMFcreative] 已收到訊息'
  end
end
