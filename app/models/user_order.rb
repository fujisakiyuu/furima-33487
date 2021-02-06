class UserOrder
  include ActiveModel::Model
  attr_accessor  :postal_code, :area_id, :municipality, :address, :building, :phone_number, :buy

  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :municipality
    validates :address
    validates :building
    validates :phone_number
    validates :buy
  end

  def save
     Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building, phone_number: phone_number, user_id: user.id)
     Order.create(item_id: item_id, user_id: user_id)
  end
end





 