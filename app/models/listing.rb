class Listing < ApplicationRecord
  validates :condition, presence: true
  validates :price, presence: true

  belongs_to :user
  belongs_to :album
end
