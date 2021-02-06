class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  has_one_attached :image
  has_one :order

with_options presence: true do
   validates :product_name
   validates :explanation
   validates :category_id
   validates :state_id 
   validates :burden_id
   validates :area_id
   validates :day_id
  with_options numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' } do
   validates :price, inclusion: { in: 300..9999999 }
  end
   validates :image
 end

 with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :state_id 
  validates :burden_id
  validates :area_id
  validates :day_id
 end
end






















