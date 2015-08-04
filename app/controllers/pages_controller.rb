class PagesController < ApplicationController
  before_action :set_auth
  def landing
    @products = Product.where(highlighted: true)
  end

  def about
  end

  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end 
end
