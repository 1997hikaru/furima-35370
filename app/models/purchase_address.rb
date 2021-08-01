class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipal, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,    numericality: { other_than: 1, message: "can't be blank" }
    validates :municipal,        format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number,     format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,  prefecture_id: prefecture_id, municipal: municipal, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end