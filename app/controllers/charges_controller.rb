class ChargesController < ApplicationController
  def new
  end

  def create
    @cart = Cart.find( session[:cart_id] ) 
    @amount = @cart.total_price * 100
    customer = Stripe::Customer.create(
      :email => @current_user.email,
      :card => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount.to_i,
      :description => 'Rails Stripe Customer',
      :currency => 'aud'
    )

    # render layout :application

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
  end
end

