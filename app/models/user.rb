class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

with_options presence: true do
   validates :nickname
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
   validates :first_name
   validates :last_name
  end
  with_options format: { with: /\A[ァ-ヶ一-]/, message: '全角カタカナを使用してください' } do
   validates :first_name_kana
   validates :last_name_kana
  end
   validates :birth_date
end
validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を使用してください'} 
end