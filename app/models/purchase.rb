class Purchase < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :item, dependent: :destroy
  belongs_to :user
end
