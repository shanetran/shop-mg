class Order
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :order_date, type: DateTime, default: Time.now
  field :message
  field :status, type: String, default: "Pending"
  
  has_many :order_details
  belongs_to :user
end
