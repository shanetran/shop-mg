module ApplicationHelper
  def flash_class(level)
    case level
    when "notice" then "success"
    when "success" then "success"
    when "error" then "error"
    when "alert" then "error"
    when "info" then "info"
    when "warn" then "warn"
    end
  end

  def cart_item
    if session[:cart]
      session[:cart].map{|i,q| q}.inject(:+)
    end
  end

  def cart_subtotal
    if session[:cart]
      total = 0
      session[:cart].map{|i,q| 
          Product.find_by(id: i).sale_price.to_i > 0 ? Product.find_by(id: i).sale_price * q : Product.find_by(id: i).price * q
        }.inject(:+)
    end
  end
  
  def breadcrumbs(product)
    name = Product.find_by(id: product)
    html = ""
    html += "<div class='product-breadcroumb'>"
    html += "<a href='/'>Home</a>"
    html += "<a href='/categories/#{name.brand.category.id}'>#{name.brand.category.name}</a>"
    html += "<a href='/brands/#{name.brand.id}'>#{name.brand.name}</a>"
    html += "<a href="">#{name.name}</a>"
    html += "</div>"
    html.html_safe
  end
end
