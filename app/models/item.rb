class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase, dependent: :destroy
  belongs_to_active_hash :category
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipment_day
  belongs_to_active_hash :status
  has_many_attached :images

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :images
    validates :category_id, :postage_payer_id, :shipping_area_id, :shipment_day_id, :status_id, numericality: { other_than: 1 }
  end
end
