class Api::LocationDiscountsController < ApplicationController
  def index
    @location_discounts = LocationDiscount.all
    render 'index.json.jbuilder'
  end
end
