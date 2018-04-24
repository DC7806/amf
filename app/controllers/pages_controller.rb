class PagesController < ApplicationController

  before_action :page_meta, only: :homepage
  
  def homepage
    @homepage_banner = Image.where(page: 'homepage', section: 'banner').eager_load(:string_translations).first.src.url
    content = Content.where(page: ['homepage', 'about-us']).eager_load(:text_translations, :string_translations)
    @homepage_about = content.select{ |item| item.page == 'homepage' && item.section == 'about'}.first.description.html_safe
    @homepage_portfolio = content.select{ |item| item.page == 'homepage' && item.section == 'portfolio'}.first.description.html_safe
    @portfolios = Portfolio.includes(:image).eager_load(:string_translations).first(3)
    @clients = Client.all.includes(:image).eager_load(:text_translations, :string_translations)
  end

  def about
    @inquiry = Inquiry.new
  end

end