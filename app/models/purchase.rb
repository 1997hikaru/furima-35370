class Purchase < ApplicationRecord
  ### Association
  belongs_to :user
  belongs_to :item
  has_one :address, dependent: :destroy
end
