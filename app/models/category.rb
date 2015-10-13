class Category
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :name
  
  has_many :brands
  
end
