class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_cost_id
  belongs_to :prefecture_id
  belongs_to :days_delivery_id


  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :price, numericality: {in:300..9999999}
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id  
    validates :prefecture_id
    validates :days_delivery_id
  end

end
