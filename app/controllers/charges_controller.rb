# frozen_string_literal: true

# payment class
class ChargesController < ApplicationController
  before_action :authenticate_user!
  def create
    @amount = 500
    customer = Stripe::Customer.create({
                                         email: params[:stripeEmail],
                                         source: params[:stripeToken]
                                       })
    charge = Stripe::Charge.create({
                                     customer: customer.id,
                                     amount: @amount,
                                     description: 'Rails Stripe customer',
                                     currency: 'inr'
                                   })
  rescue Stripe::CardError => e
    redirect_to new_charge_path, error: e.message
  end
end
