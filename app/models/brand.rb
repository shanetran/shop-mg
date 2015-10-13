class Brand
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :name
  
  has_many :products
  belongs_to :category
  
end
