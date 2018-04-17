class InquiriesController < ApplicationController

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if verify_recaptcha(model: @inquiry) && @inquiry.save
      # send mail
      InquiryMailer.delay.user_notification(@inquiry)
      InquiryMailer.delay(run_at: 1.minute.from_now).admin_notification(@inquiry)
      redirect_back(fallback_location: request.referrer)
      flash[:notice] = t('frontend.contact.message_sent')
    else
      # for rendered template
      # @contacts = YAML::load_file("#{Rails.root}/config/contacts.yml")
      # @contacts_hq_zh = @contacts.slice('hq_zh')
      # @contacts_hq_en = @contacts.slice('hq_en')
      flash[:alert] = t('frontend.contact.message_failed')
      render template: 'pages/about', layout: true
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:prefix, :first_name, :last_name, :number, :email, :message)
  end

end
