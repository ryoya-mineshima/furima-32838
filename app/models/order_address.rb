class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number,format: {
       with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(
      post_cord: post_cord, 
      prefecture_id: prefecture_id, 
      city: city, address: address, 
      building: building, 
      phone_number: phone_number, 
      purchase_record_id: purchase_record.id)
  end
end
