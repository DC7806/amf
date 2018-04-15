module DeviseAdminLocale
  extend ActiveSupport::Concern
  included do
    
    before_action :set_locale

    def set_locale
      I18n.locale = :'zh-TW'
    end

    def default_url_options options = {}
    {locale: nil }
    end

  end
end