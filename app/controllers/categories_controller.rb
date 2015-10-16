class CategoriesController < ApplicationController
  def show
    @cate = Category.find_by(id: params[:id].to_i)
    brand = Brand.find_by(category_id: @cate)
    @products = Product.where('brand_id' => {'$eq' => brand}).page params[:page]
  end
end
