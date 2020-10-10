class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  belongs_to_active_hash :category
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipment_day
  belongs_to_active_hash :status
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category, :postage_payer, :shipping_area, :shipment_day, :status, presence: true
  validates :category_id, :postage_payer_id, :shipping_area_id, :shipment_day_id, :status_id, numericality: { other_than: 1 }
  validates :image, presence: true
end
