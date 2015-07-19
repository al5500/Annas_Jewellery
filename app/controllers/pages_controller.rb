class PagesController < ApplicationController
  def landing
    @products = Product.all
  end

  def about
  end
end
