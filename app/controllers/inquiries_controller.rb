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
      content = Content.where(page: 'about-us').eager_load(:text_translations, :string_translations).first
      @about_banner = content.image.src.url
      @about_description = content.description.html_safe
      @teams = Team.order(sort: :asc).eager_load(:text_translations, :string_translations).includes(:image)
      @contact_info = YAML::load_file("#{Rails.root}/yamls/about.yml")
      @about_contact_info = Image.where(page: 'about-us', section: 'contact-info').first
      flash[:alert] = t('frontend.contact.message_failed')
      render template: 'pages/about', layout: true
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:prefix, :first_name, :last_name, :number, :email, :message)
  end

end
