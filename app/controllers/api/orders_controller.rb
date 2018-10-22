pclass Api::OrdersController < ApplicationController

before_action :authenticate_user

  def index
    @order = current_user.orders
    render 'index.json.jbuilder'
  end  

  
  def create
    carted_products = current_user.cart
    @order = Order.new(user_id: current_user.id)

    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.quantity = carted_product.product.price
      product.price
    end  

    tax = subtotal * 0.09
    total = subtotal + tax

  
    @order.save

    carted_products.updated.all[status: "purchased", order_id: @order.id]
     
     render 'show.json.jbuilder'
   end 
   
end


