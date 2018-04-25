module InquiriesHelper
  # switch first and last name order based on locale
  def name_order(f, locale)
    first_name = content_tag :div, class: 'form-group col-sm-6' do
                  (f.label :first_name, t('frontend.contact.first_name')+'*')+
                  (f.text_field :first_name, class: 'form-control') 
                 end   
    last_name = content_tag :div, class: 'form-group col-sm-6' do
                  (f.label :last_name, t('frontend.contact.last_name')+'*')+
                  (f.text_field :last_name, class: 'form-control') 
                end 
    if locale == :'zh-TW' || locale == :'zh-CN'
      last_name + first_name
    else
      first_name + last_name
    end
  end
end
