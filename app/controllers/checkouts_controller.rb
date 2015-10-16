class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  def index
    @top_sell = Product.where('sale_price' => {'$gt' => 0}).limit(4)
    @top_new = Product.order_by(id: :desc).limit(4)
  end
end
