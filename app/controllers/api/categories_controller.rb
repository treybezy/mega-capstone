class Api::CategoriesController < ApplicationController
  def create
    @categories = Category.new(
                                name: params[:name]
      )
    if @category.save
    render '_category.json.jbuilder'
  else
    render json: {errors: @category.errors.full_messages}, status: :unprocessable_entity
  end
  def show
    category_id = params[:id]
    @category = Category.find(category_id)
    render '_category.json.jbuilder'
  end

  def destroy
    category_id = params[:id]
    @category = Category.find(category_id)
    @category.destroy
    render json: {message: "Category is destroyed"}
  end
   
 end
