class BrandsController < ApplicationController
  def show
    @brand = Brand.find_by(id: params[:id].to_i)
    @products = Product.where('brand_id' => {'$eq' => @brand}).page params[:page]
  end
end
