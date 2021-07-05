class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
       validates :nickname
       validates :last_name,            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
       validates :first_name,           format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
       validates :last_name_reading,    format: { with: /\A[ァ-ヶー－]+\z/ }
       validates :first_name_reading,   format: { with: /\A[ァ-ヶー－]+\z/ }
       validates :birthday
       validates :password,             format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
  end
end