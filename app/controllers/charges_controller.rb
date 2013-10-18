class ChargesController < ApplicationController


def new
end

def create
  # Amount in cents
  @amount =params[:rate] 

  customer = Stripe::Customer.create(
    :email => 'anand21@gmail.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => cus_2UgRYvuGXVcaze,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end

private
    def vehicle_params
      params.require(:vechicle).permit(:rate)
    end   
end
