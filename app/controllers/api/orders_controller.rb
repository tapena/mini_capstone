class Api::OrdersController < ApplicationController

before_action :authentication_user, only: [:index, :create]

  def index
    @order = current_user.orders
    render 'index.json.jbuilder'
  end  

  
  def create
    
    @order = Order.new(
                      user_id: current_user.id,
                      product_id: params[:product_id],
                      quantity: params[:quantity],
                      )
  
    @order.build_totals
    @order.calculate_total

    @order.save
    render "show.json.jbuilder"
  end
end


