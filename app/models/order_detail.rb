class OrderDetail
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :quantity, type: Integer
  field :price, type: Float
  field :total, type: Float
  
  has_many :products
  belongs_to :order
  
end
