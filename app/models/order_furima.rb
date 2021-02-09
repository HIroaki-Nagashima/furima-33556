class OrderFurima
  
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalty, :adress, :building, :phone_number, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postal code Input correctly" }
    validates :area_id, numericality: { other_than: 0 }
    validates :municipalty
    validates :adress
    validates :phone_number, format: { with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "Phone number Input only number" }
  end

  def save
    order = Oder.create
    Adress.create(postal_code: postal_code, municipalty: municipalty, adress: adress, building: building, phone_number: phone_number, order_id: order.id)
  end
end