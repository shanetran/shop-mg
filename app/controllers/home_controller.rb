class HomeController < ApplicationController
  def index
    if session[:recently_viewed]
      @recently_viewed = Product.where(id: { '$in' => session[:recently_viewed] }).limit(4)
    end
    @products = Product.order_by(id: :asc).limit(10)
    @top_sell = Product.where('sale_price' => {'$gt' => 0}).limit(4)
    @top_new = Product.order_by(id: :desc).limit(4)
  end

  def search
    @products = Product.full_text_search(params[:key], match: :any).page params[:page]
  end
end
