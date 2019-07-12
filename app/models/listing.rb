class Listing < ApplicationRecord
  validates :condition, presence: true
  validates :price, presence: true
end
