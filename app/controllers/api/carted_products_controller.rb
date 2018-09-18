class Api::CartedProductsController < ApplicationController

  def create 
    @carted = Carted.new(
                        product_id: params[:product_id],
                        quantity: params[:quantity]  
                        )                
  end                    
end
