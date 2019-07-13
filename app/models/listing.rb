class Listing < ApplicationRecord
  validates :condition, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :album_id, presence: true

  belongs_to :user
  belongs_to :album
end
