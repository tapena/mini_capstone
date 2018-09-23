class Api::ProductsController < ApplicationController
before_action :authenticate_admin, except: [:index, :show]
  
  def index
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    sort_order = params[:sort_order]

    @product = Product.all
    search_term = params[:search]

    @products = Product.all

    category_name = params[:category]
    if category_name
      category = Category.find_by(name: category_name)
      @products = @products.category
    end  

    if search_term
      @products = @products.where(
                                  "name iLIKE ? OR image_url iLIKE ?", 
                                  "%#{search_term}%", 
                                  "%#{search_term}%"
                                  )
    elsif
      render 'index.json.jbuilder'
    end  
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