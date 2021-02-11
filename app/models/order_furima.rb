class OrderFurima
  
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalty, :adress, :building, :phone_number, :user_id, :token, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Postal code Input correctly" }
    validates :area_id, numericality: { other_than: 0 }
    validates :municipalty
    validates :adress
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Phone number Input only number" }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Adress.create(area_id: area_id, postal_code: postal_code, municipalty: municipalty, adress: adress, building: building, phone_number: phone_number, order_id: order.id)
  end
end