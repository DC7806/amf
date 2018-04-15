class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.order(sort: :asc)
  end

end
