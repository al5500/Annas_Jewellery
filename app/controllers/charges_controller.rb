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

    @cart.line_items.each do |item|
      Stripe::InvoiceItem.create(
        customer: customer.id,
        amount: item.product.price.to_i * 100,
        currency: "aud",
        description: item.product.name
      )
    end

    invoice = Stripe::Invoice.create(
      customer: customer.id
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
  end
end

