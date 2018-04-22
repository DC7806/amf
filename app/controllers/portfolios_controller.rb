class PortfoliosController < ApplicationController

  before_action :page_meta

  def index
    @portfolios = Portfolio.order(sort: :asc)
  end

end
