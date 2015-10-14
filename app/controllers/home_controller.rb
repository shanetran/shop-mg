class HomeController < ApplicationController
  def index
    @recently_viewed = Product.where(id: { '$in' => session[:recently_viewed] }).limit(4)
    session[:recently_viewed]
    @products = Product.order_by(id: :asc).limit(10)
    @top_sell = Product.where('sale_price' => {'$gt' => 0}).limit(4)
    @top_new = Product.order_by(id: :desc).limit(4)
  end
end
