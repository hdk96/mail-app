class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Annual subscription for #{customer.email}",
      :currency    => 'eur'
    )

    @subscriber = Subscriber.create(stripe_id: charge.customer, amount_paid: charge.amount, email: customer.email)
    ContactMailer.contact(@subscriber).deliver

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
         
  end

end
