class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :days_delivery

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :price, numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :days_delivery_id
  end
end
