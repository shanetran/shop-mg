class ProductsController < ApplicationController
  def index
    @products = Product.order_by(:name => :desc).page params[:page]
  end

  def show
    @product = Product.find_by(id: params[:id])
    @related_product = Product.where('brand_id' => {'$eq' => @product.brand_id.to_i}).limit(10)
    @top_sell = Product.where('sale_price' => {'$gt' => 0}).limit(4)
    @top_new = Product.order_by(id: :desc).limit(4)
    (session[:recently_viewed] ||= []) << params[:id]
  end
end
