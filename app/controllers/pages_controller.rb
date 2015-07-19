class PagesController < ApplicationController
  def landing
    @products = Product.where(highlighted: true)
  end

  def about
  end
end
