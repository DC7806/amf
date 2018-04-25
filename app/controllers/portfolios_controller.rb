class PortfoliosController < ApplicationController

  before_action :page_meta

  def index
    @portfolios = Portfolio.order(sort: :asc).eager_load(:text_translations, :string_translations).includes(:image)
  end

end
