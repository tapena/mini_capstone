class Api::ProductsController < ApplicationController

  def index
    @product = Product.all
    render "index.json.jbuilder"
  end

  def show
    @product = Product.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    @product = Product.new(
                          name: params[:name],
                          price: params[:price],
                          image_url: params[:image_url],
                          description: params[:description]
                          )
   @product.save
   render 'show.json.jbuilder'
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