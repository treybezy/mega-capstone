class Api::LocationsController < ApplicationController
  def index
    @locations = Location.all 
    render 'index.json.jbuilder'
  end
  
  def show 
    location_id = params[:id]
    @location = Location.find(location_id)
    render 'show.json.jbuilder'
  end

  def create
    @location = Location.new(
                              address: params[:address],
                              city: params[:city],
                              state: params[:state],
                              zip: params[:zip]
                              )
    if @location.save
       @location_discount = LocationDiscount.new(
                                                discount_id: params[:discount_id],
                                                location_id: @location.id
                                                  )
       @location_discount.save
       render 'show.json.jbuilder'
    else
       render json: {errors: @location.errors.full_messages}, status: :unprocessable_entity
     end
  end
  
  def destroy
    location_id = params[:id]
    @location = Location.find(discount_id)
    @discount.destroy
    render json: {message: "location is destroyed"}
  end
end
