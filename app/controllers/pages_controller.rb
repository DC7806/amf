class PagesController < ApplicationController

  before_action :page_meta, only: :homepage
  
  def homepage
  end

  def about
    @inquiry = Inquiry.new
  end

end