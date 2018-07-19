class Api::DiscountsController < ApplicationController
  def index
    @discounts = Discount.all
    render 'index.json.jbuilder'
  end


  def show
    discount_id = params[:id]
    @discount = Discount.find(discount_id)
    render 'show.json.jbuilder'
  end

  def create
    @discount = Discount.new(
                             name: params[:name],
                             description: params[:description],
                             brand: params[:brand],
                             discounted_price: params[:discounted_price],
                             date_available: params[:date_available]
                             )
    if @discount.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @discount.errors.full_messages}, status: :unprocessable_entity
    end 
  end

    def update
         discount_id = params[:id]
        @product = Product.find(product_id)

        @discount.name = params[:name] || @product.name
        @discount.description = params[:description] || @product.description
        @discount.brand = params[:brand] || @product.brand
        @discount.discounted_price = params[:discounted_price] || @product.discounted_price
        @discount.date_available = params[:date_available] || @product.date_available

      if @discount.save
        render 'show.json.jbuilder'
      else
       render json: {errors: @discount.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def destroy
      discount_id = params[:id]
      @discount = Discount.find(discount_id)
      @discount.destroy
      render json: {message: "Discount is destroyed"}
    end
end
