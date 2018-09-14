class Api::ProductsController < ApplicationController
  
  def index
    @products = Product.all
    search_term = params[:search]
    if search_term
      @products = @products.where(
                              "name iLIKE ? OR image_url iLIKE ?", 
                              "%#{search_term}%", 
                              "%#{search_term}%"
                              )
  end
  
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
  if sort_attribute && sort_order
    @products = @products.order(sort_attribute => sort_order)
  elsif sort_attribute
    @products = @products.order(sort_attribute)
  end
    render 'index.json.jbuilder'
  end

  def create
    @product = Product.new(
                          name: params[:name],
                          price: params[:price],
                          image_url: params[:image_url],
                          description: params[:description]
                          )
    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    
    @product.save
    render "show.json.jbuilder"
  end
   
  def destroy
    @product = product.find(params[:id])
    @product.destroy
    render json: {message: "Destroyed"}
  end
end