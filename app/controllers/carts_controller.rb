class CartsController < ApplicationController
  def index
    @carts = session[:cart]
    @top_sell = Product.where('sale_price' => {'$gt' => 0}).limit(4)
    @top_new = Product.order_by(id: :desc).limit(4)
    @interested = Product.where('sale_price' => {'$gt' => 0}).limit(2)
  end

  def add
    id = params[:id]
    quantity = params[:quantity].to_i
    if session[:cart]
      cart = session[:cart]
      if cart[id] && (quantity > 1)
        cart[id] += quantity
      elsif cart[id] && (quantity == 1)
        cart[id] += 1
      else 
        cart[id] = 1
      end 
    else
      session[:cart] ||= {}
      cart = session[:cart]
      cart[id] = quantity
    end
    
    flash[:success] = "Added cart."
    redirect_to carts_path
  end
  
  def remove
    id = params[:id]
    session[:cart].delete(id)
    flash[:success] = "Remoce item cart complete."
    redirect_to carts_path
  end
end
