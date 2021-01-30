class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  has_one_attached :image

  with_options presence: true do
   validates :product_name
   validates :explanation
   validates :category_id
   validates :state_id 
   validates :burden_id
   validates :area_id
   validates :day_id
   validates :price
   validates :image
 end

 validates :category_id, numericality: { other_than: 1 } 
 validates :state_id , numericality: { other_than: 1 } 
 validates :burden_id, numericality: { other_than: 1 } 
 validates :area_id, numericality: { other_than: 1 } 
 validates :day_id, numericality: { other_than: 1 } 
end






















