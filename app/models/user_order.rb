class UserOrder
  include ActiveModel::Model
  attr_accessor  :postal_code, :area_id, :municipality, :address, :building, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id
    validates :municipality
    validates :address
    validates :phone_number, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end

  

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
     Address.create(
       postal_code: postal_code, 
       area_id: area_id, 
       municipality: municipality, 
       address: address, 
       building: building, 
       phone_number: phone_number, 
       order_id: order.id)
  end
end





 