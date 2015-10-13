class Product
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Paperclip
  
  has_mongoid_attached_file :image
  
  field :name
  field :description
  field :stock, type: Integer
  field :price, type: Float
  field :sale_price, type: Float
  field :view, type: Integer
  field :rate, type: Float

  belongs_to :brand
  belongs_to :order_detail
end
