class PagesController < ApplicationController
  
  def homepage
  end

  def about
    @inquiry = Inquiry.new
  end

end